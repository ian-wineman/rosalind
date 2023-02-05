function revc(dna)
  dna_c = replace(reverse(dna), "A" => "T", "T" => "A", "C" => "G", "G" => "C")
  return dna_c
end

println(revc("AAAACCCGGT"))