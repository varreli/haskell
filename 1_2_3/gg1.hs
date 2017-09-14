gg :: (a -> b) -> a -> c -> b
-- gg f a c = f a
gg = \f a c -> f a

-- λ > gg (flip const) 6 7 "qq"
-- "qq"                          -- equivalent to:
-- λ > gg (const id) 3 7 "yy"
-- "yy"

-- λ > gg (+) 5 7 6
-- 11

-- λ > ( (\f a c -> f a) const 1 2 "t" )
-- 1

-- note gg and (+) unify and require a 
-- third parameter :

-- λ > ((\f a c -> f a) (+) 1 2 3 ) 
-- 4

-- note (not) only takes 1 Bool arg but still
-- requires two args because f a c -> f a:

-- λ > ((\f a c -> f a) (not) False "t") 
-- True

