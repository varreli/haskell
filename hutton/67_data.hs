data Nat = Zero | Succ Nat deriving Show

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n - 1 ))

adder :: Nat -> Nat -> Nat
adder m n = int2nat (nat2int m + nat2int n)

adder' :: Nat -> Nat -> Nat
adder' Zero n = n
adder' (Succ m) n = Succ (adder' m n)

