factorial n = if n < 2 then 1 else n * factorial (n-1)

factorial' n
  | n > 1 = n * factorial' (n - 1)
  | otherwise = 1


fact :: Int -> Int
fact 0 = 1
fact n = product [1..n] -- less elegant: fact n = n * fact (n-1)

main = print $ map fact [12, 4, 7]


-- pattern matching:

factt :: Integer -> Integer 
factt 0 = 1
factt n = n * fact' (n-1)

--iterative solution:

fact' n = foldl (*) 1 [1..n]

-- simplicity:

facct n = product [1..n]
