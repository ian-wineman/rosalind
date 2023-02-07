function hamm(string1, string2)
  return sum([string1[i] != string2[i] for i=1:length(string1)])
end

println(hamm("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"))