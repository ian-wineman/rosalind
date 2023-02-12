struct Fasta
    strings::Vector{Tuple{String, String}}
end
  
function parse_fasta(fasta::String)::Fasta
    pattern = r">(?<label>.*)\n(?<string>[ATCG\n]*)"
    return Fasta([(String(match["label"]),replace(match["string"],"\n" => "")) for match in eachmatch(pattern, fasta)])
end

function lcsm(fasta::String)
    strings = [s[2] for s=parse_fasta(fasta).strings]
    substrings = ["A", "C", "G", "T"]
    
    while true 
        matches = 0
        matching_substrings = String[]
        
        for sub=substrings
            sub1, sub2, sub3, sub4 = (join([sub,"A"]), join([sub,"C"]), join([sub,"G"]), join([sub,"T"]))
            
            for sub=[sub1, sub2, sub3, sub4]
                if sum([occursin(sub,s) for s=strings]) == length(strings)
                    matches += 1
                    push!(matching_substrings, sub)
                end
            end
    
        end
            
        if matches == 0
            return sort(substrings, rev=true)[1]
        else
            substrings = matching_substrings
        end
    end
end

println(lcsm(">Rosalind_1
GATTACA
>Rosalind_2
TAGACCA
>Rosalind_3
ATACA"))