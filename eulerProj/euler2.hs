fib = (let x = 1 : 2 : zipWith (+) x (tail x) in x)

fibb = sum $ filter even $ takeWhile (< 4000000) fib
