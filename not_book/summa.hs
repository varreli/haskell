import Debug.Trace

summa :: [Int] -> Int

-- this traces all calls:
summa [] = traceShowId 0
summa (x:xs) = traceShowId $ x + summa xs

main = print $ summa [12,3,55,1]

-- or to only show the recursive calls:
-- summa [] = 0
-- summa (x:xs) = x + traceShowId (summa xs)
