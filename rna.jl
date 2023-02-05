function translate(dna)
  return replace(dna, "T" => "U")
end

println(translate("GATGGAACTTGACTACGTAAATT"))