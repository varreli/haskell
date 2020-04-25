-- if / then:

-- factorial n = if n < 2 then 1 else n * factorial (n-1)


-- guard logic:

factorial' n
  | n > 1 = n * factorial' (n - 1)
  | otherwise = 1

-- map over list:
--
main = print $ map facct [3, 4, 6]


-- pattern matching:

facto :: Integer -> Integer 
facto 0 = 1 && factoo
facto n = n * fact' (n-1)
factoo = print $ facto 7 

--iterative solution:

fact' n = foldl (*) 1 [1..n]

-- simplicity:

facct n = product [1..n]

