struct Fasta
    strings::Vector{Tuple{String, String}}
end
  
function parse_fasta(fasta::String)::Fasta
    pattern = r">(?<label>.*)\n(?<string>[ATCG\n]*)"
    return Fasta([(String(match["label"]),replace(match["string"],"\n" => "")) for match in eachmatch(pattern, fasta)])
end

function make_overlap_graph(fasta::Fasta,k::Int64)
    tups = fasta.strings
    tups_pre_suf = [(t[1],t[2],t[2][1:k],t[2][end-k+1:end]) for t=tups]
    graph = String[]

    for tupSuf=tups_pre_suf
        for tupPre=tups_pre_suf
            if tupSuf[2] != tupPre[2]
                if tupSuf[4] == tupPre[3]
                    push!(graph, join([tupSuf[1], tupPre[1]], " "))
                end
            end
        end
    end

    for g=graph
        println(g)
    end
end

make_overlap_graph(parse_fasta(">Rosalind_0498
AAATAAA
>Rosalind_2391
AAATTTT
>Rosalind_2323
TTTTCCC
>Rosalind_0442
AAATCCC
>Rosalind_5013
GGGTGGG"),3)