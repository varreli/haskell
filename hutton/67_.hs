data Nat = Zero | Succ Nat deriving Show

add' :: Nat -> Nat -> Nat
add' Zero n = n
add' (Succ m) n = Succ (add' m n)
