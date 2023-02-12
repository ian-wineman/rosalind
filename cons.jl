struct Fasta
  strings::Vector{Tuple{String, String}}
end

function parse_fasta(fasta::String)::Fasta
  pattern = r">(?<label>.*)\n(?<string>[ATCG\n]*)"
  return Fasta([(String(match["label"]),replace(match["string"],"\n" => "")) for match in eachmatch(pattern, fasta)])
end

function make_profile(fasta::Fasta)::Matrix{Int64}
  d = Dict('A' => 1, 'C' => 2, 'G' => 3, 'T' => 4)
  profile = zeros(Int64, (4,length(fasta.strings[1][2])))
  
  for s=[s[2] for s=fasta.strings]
      for (index, base)=enumerate(s)
          profile[d[base], index] += 1
      end
  end
  
  return profile
end

function cons(profile::Matrix{Int64})
  d = Dict("1" => "A", "2" => "C", "3" => "G", "4" => "T")
  consensus = join([d[string(findmax(profile[:,i])[2])] for i=1:size(profile)[2]])
  
  println(consensus)
  println("A: " * join([profile[1,j] for j=1:size(profile)[2]], " "))
  println("C: " * join([profile[2,j] for j=1:size(profile)[2]], " "))
  println("G: " * join([profile[3,j] for j=1:size(profile)[2]], " "))
  println("T: " * join([profile[4,j] for j=1:size(profile)[2]], " "))
end

cons(make_profile(parse_fasta(">Rosalind_1
ATCCAGCT
>Rosalind_2
GGGCAACT
>Rosalind_3
ATGGATCT
>Rosalind_4
AAGCAACC
>Rosalind_5
TTGGAACT
>Rosalind_6
ATGCCATT
>Rosalind_7
ATGGCACT")))