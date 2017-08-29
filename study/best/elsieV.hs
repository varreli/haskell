ifThenEls :: (Ord a, Num a) => a -> a -> a
ifThenEls = (\x -> (\y -> (if x > y then y else x) + 5))

ifThenElse :: (Ord a, Num a) => a -> a -> a
ifThenElse = (\x -> \y -> (if x > y then y else x ) + 5)

ifThenElsie :: (Ord a, Num a) => a -> a -> a
ifThenElsie = (\x y -> (if x > y then y else x ) + 5)

ifThenElsieV :: (Ord a, Num a) => (a, a) -> a
ifThenElsieV (x, y) = (if x > y then y else x ) + 5

-- READ !!
-- (Akii) : use ghci to check last 2 functions above :

-- λ > :t uncurry
-- uncurry :: (a -> b -> c) -> (a, b) -> c

-- λ > :t uncurry ifThenElsie
-- uncurry ifThenElsie :: (Ord c, Num c) => (c, c) -> c

-- λ > :t curry ifThenElsieV
-- curry ifThenElsieV :: (Ord c, Num c) => c -> c -> c

-- λ > :t uncurry ifThenElsieV 4 5
-- uncurry ifThenElsieV 4 5
--   :: (Ord (b -> t -> t1), Num ((b -> t -> t1, b -> t -> t1), b),
--       Num (b -> t -> t1), Num t) => t1

-- λ > :t curry ifThenElsieV 4 5
-- curry ifThenElsieV 4 5 :: (Ord c, Num c) => c
