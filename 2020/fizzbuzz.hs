{-# LANGUAGE ViewPatterns #-}

-- ghci> :set -XViewPatterns
-- ghci> let f ((\x -> x `mod` 3 == 0 && x `mod` 5 == 0) -> True) = "FizzBuzz"; f x = show x in map f [1..20]

-- ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","FizzBuzz","16","17","18","19","20"]

-- only works in ghci with flag 
-- ghci> :set -XViewPatterns

fizz = let f ((\x -> x `mod` 3 == 0 && x `mod` 5 == 0) -> True) = "FizzBuzz" ; f x = show x in map f [1..20]
