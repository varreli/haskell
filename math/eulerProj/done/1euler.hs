-- A lazy infinite sequence of fib numbers:

fib = (let x = 1 : 1 : zipWith (+) x (tail x) in x)

sumFibs = sum $ filter even $ takeWhile (<= 400) fib


productFibs = foldr (*) 1 $ takeWhile (<= 10) fib 

-- note seed is 1 for multiplication
