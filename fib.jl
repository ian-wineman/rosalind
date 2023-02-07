function fib(n,k)
  if n == 1
      return 1
  elseif n == 2
      return 1
  else
      return fib(n-1,k) + k*fib(n-2,k)
  end
end

println(fib(5,3))