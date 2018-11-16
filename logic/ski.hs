-- Peano / Church numbers in the ski calculus:

data Nat = Zero | Succ Nat deriving Show

s f g h = f h (g h)
k f g   = f
i f     = f

compose = s (s (k s) k) i

