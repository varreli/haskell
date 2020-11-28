{-# LANGUAGE ScopedTypeVariables #-}

-- example of core haskell:

f = \(x :: Bool) -> \(y :: Bool) -> (&&) (not x) y

main = print $ f False True 
