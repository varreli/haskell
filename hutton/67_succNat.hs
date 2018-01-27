data Nat = Zero | Succ Nat deriving Show

adder :: Nat -> Nat -> Nat
adder Zero n = n
adder (Succ m) n = Succ (adder m n)

-- > adder (Succ (Succ Zero)) (Succ Zero)
-- Succ (adder (Succ Zero) (Succ Zero))
-- Succ (Succ (adder Zero (Succ Zero)))
-- Succ (Succ (Succ Zero))

