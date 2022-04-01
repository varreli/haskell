
data Nat = Zero | Succ Nat 

expp :: Num a => a -> Nat -> a
expp x Zero      = 1
expp x (Succ n) = x * (expp x (Succ n))
