-- Anything that works with infinite lists, such as fibonaccis, 
-- must be co-recursive. Corecursive algorithms use the data bits 
-- that they themselves produce as they become available and needed.

-- computes to fib num 89:

fibo = takeWhile (< 144) x
  where x = 1 : 1 : zipWith (+) x (tail x)

fibon = take 3 (let x = 1 : 1 : zipWith (+) x (tail x) in x)

fibs = take 10 (let x = 1 : 1 : zipWith (+) x (tail x) in x)

-- λ> zipWith (+) [1..5] [10..15]
-- [11,13,15,17,19] 

--------------------------------------------------------------------

-- λ> zipWith (+) [2,3] ([6,7])
-- [8,10]

-- Note - only computes with tail value:

-- λ> zipWith (+) [2,3] (tail [6,7])
-- [9]
--------------------------------------------------------------------

-- fibonacci using a left fold (here as scanl):

fibScan = 1 : scanl (+) 1 fibScan
 
main = print $ take 7 fibScan


fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 2) + fib (n - 1)
