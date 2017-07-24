fact :: Int -> Int
fact 0 = 1
fact n = product [1..n] -- less elegant: fact n = n * fact (n-1)

main = print $ map fact [12, 4, 7]


-- https://en.wikipedia.org/wiki/Proof_assistant#Comparison
-- https://en.wikipedia.org/wiki/Dependent_type#Comparison

-- http://stackoverflow.com/questions/6806946/built-in-factorial-function-in-haskell
