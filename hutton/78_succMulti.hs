

data Nat = Zero | Succ Nat deriving Show

add :: Nat -> Nat -> Nat
add Zero n     = n
add (Succ m) n = Succ (add m n)

multi :: Nat -> Nat -> Nat
multi m Zero     = Zero
multi m (Succ n) = add m (multi m n)

 -- λ > multi (Succ (Succ (Succ Zero))) (Succ (Succ (Succ Zero)))
 -- Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ Zero))))))))

