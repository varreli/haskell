-- if / then:

factorial n = if n < 2 then 1 else n * factorial (n-1)

--guard logic:

factorial' n
  | n > 1 = n * factorial' (n - 1)
  | otherwise = 1

-- map over list:
--
main = print $ map facct [12, 4, 7]


-- pattern matching:

factt :: Integer -> Integer 
factt 0 = 1
factt n = n * fact' (n-1)

--iterative solution:

fact' n = foldl (*) 1 [1..n]

-- simplicity:

facct n = product [1..n]
