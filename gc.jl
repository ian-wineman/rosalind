function gc_content(string)
  return 100*(count(==('G'), string) + count(==('C'), string))/length(string)
end

function parse_fasta(fasta)
  pattern = r">(?<label>.*)\n(?<string>[ATCG\n]*)"
  return [(String(match["label"]),replace(match["string"],"\n" => "")) for match in eachmatch(pattern, fasta)]
end

function gc(fasta)
  pairs = parse_fasta(fasta)
  scored_pairs = [(p[1],p[2],gc_content(p[2])) for p=pairs]
  highest_gc_content = sort!(scored_pairs, by=x->x[3], rev=true)[1]

  return "$(highest_gc_content[1])\n$(highest_gc_content[3])"
end

println(gc(">Rosalind_6404
CCTGCGGAAGATCGGCACTAGAATAGCCAGAACCGTTTCTCTGAGGCTTCCGGCCTTCCC
TCCCACTAATAATTCTGAGG
>Rosalind_5959
CCATCGGTAGCGCATCCTTAGTCCAATTAAGTCCCTATCCAGGCGCTCCGCCGAAGGTCT
ATATCCATTTGTCAGCAGACACGC
>Rosalind_0808
CCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGAC
TGGGAACCTGCGGGCAGTAGGTGGAAT"))