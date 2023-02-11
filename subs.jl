function subs(substring, string)
  return join([m.offset for m=eachmatch(Regex(substring), string; overlap=true)], " ")
end

println(subs("ATAT", "GATATATGCATATACTT"))