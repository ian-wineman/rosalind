function count_dna_n(dna_string)
  a = 0; c = 0; g = 0; t = 0

  for n in dna_string
    if n == 'A'
      a += 1
    elseif n == 'C'
      c += 1
    elseif n == 'G'
      g += 1
    elseif n == 'T'
      t += 1
    else
      #
    end
  end
  return "$(a) $(c) $(g) $(t)"
end

println(count_dna_n("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"))