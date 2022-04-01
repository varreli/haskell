
data Nat = Zero | Succ Nat 

exponent :: Num a => a -> Nat -> a
exponent x Zero      = 1
exponent x (Succ n) = x * exponent x n


-- ghci> exponent 3 (Succ (Succ (Succ Zero)))
-- 27


