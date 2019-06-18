fact :: Int -> Int
fact 0 = 1
fact n = product [1..n] -- less elegant: fact n = n * fact (n-1)

main = print $ map fact [12, 4, 7]


-- less elegant with much larger Integer range :

fact' :: Integer -> Integer 
fact' 0 = 1
fact' n = n * fact' (n-1)


-- https://en.wikipedia.org/wiki/Proof_assistant#Comparison
-- https://en.wikipedia.org/wiki/Dependent_type#Comparison

-- http://stackoverflow.com/questions/6806946/built-in-factorial-function-in-haskell

