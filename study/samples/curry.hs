Prelude> let curry f a b = f (a, b)
Prelude> :t curry
curry :: ((a, b) -> c) -> a -> b -> c

-- (a,b) is listed first because it's the first
-- of the first argument to be curried.

Prelude> :t fst
fst :: (a, b) -> a
Prelude> :t curry fst
curry fst :: t -> b -> t

Prelude> fst (1, 2)
1
Prelude> curry fst 1 2
1

