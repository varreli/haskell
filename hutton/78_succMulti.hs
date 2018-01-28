
data Nat = Zero | Succ Nat deriving Show

add :: Nat -> Nat -> Nat
add Zero n     = n
add (Succ m) n = Succ (add m n)

multi :: Nat -> Nat -> Nat
multi m Zero     = Zero
multi m (Succ n) = add m (multi m n)

--   > multi (Succ (Succ Zero)) (Succ Zero)
--   = add (Succ (Succ Zero)) (multi (Succ (Succ Zero)) Zero)
--   = add (Succ (Succ Zero)) Zero
--   => Succ (Succ Zero)

