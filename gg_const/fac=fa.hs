gg :: (a -> b) -> a -> c -> b
-- gg f a c = f a
gg = \f -> a -> c -> f a

-- λ > gg (flip const) 6 7 "qq"
-- "qq"
-- λ > gg (const id) 3 7 "yy"
-- "yy"

-- λ > gg (+) 5 7 6
-- 11



-- Understanding gg is how to evaluate :

-- ( (\f a c -> f a) const 1 2 "t" )
--
--
