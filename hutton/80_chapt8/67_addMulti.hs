
data Nat = Zero | Succ Nat deriving Show

add :: Nat -> Nat -> Nat
add Zero n     = n
add (Succ m) n = Succ (add m n)

-- > add (Succ (Succ Zero)) (Succ Zero)
--   = Succ (add (Succ Zero) (Succ Zero))
--   = Succ (Succ (add Zero (Succ Zero)))
--   = Succ (Succ (Succ Zero))


-- additive multiplication:

multi :: Nat -> Nat -> Nat
multi m Zero     = Zero
multi m (Succ n) = add m (multi m n)

--   > multi (Succ (Succ Zero)) (Succ Zero)
--   = add (Succ (Succ Zero)) (multi (Succ (Succ Zero)) Zero)
--   = add (Succ (Succ Zero)) Zero
--   => Succ (Succ Zero)

