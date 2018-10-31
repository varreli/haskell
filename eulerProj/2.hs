-- A lazy infinite sequence of fib numbers:

fib = (let x = 1 : 2 : zipWith (+) x (tail x) in x)

sumFibs = sum $ filter even $ takeWhile (<= 4000000) fib
