function fib(n,k)
    if n == 1
        return 1
    elseif n == 2
        return 1
    else
        return fib(n-1,k) + k*fib(n-2,k)
    end
end

function fibd(n,m)
    fibs = [fib(i,1) for i=1:m]

    for i=(m+1):n
        push!(fibs, sum([fibs[j] for j=(i-m):(i-2)]))
    end
    
    return fibs[end]
end

println(fibd(6,3))