function iprb(k,m,n)
  z = k + m + n
  s1 = (k/z)*((k-1)/(z-1)) + (k/z)*(m/(z-1)) + (k/z)*(n/(z-1))
  s2 = (m/z)*(k/(z-1)) + 0.75*(m/z)*((m-1)/(z-1)) + 0.5*(m/z)*(n/(z-1))
  s3 = (n/z)*(k/(z-1)) + 0.5*(n/z)*(m/(z-1))
  
  return s1 + s2 + s3
end

println(iprb(2,2,2))