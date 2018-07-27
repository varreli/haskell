
summ :: Num a => [a] -> a
summ = foldr (+) 0               -- unit: n + 0 = n

prod :: Num a => [a] -> a
prod = foldr (*) 1               -- unit: n * 1 = n

orr :: [Bool] -> Bool
orr = foldr (||) False           -- unit: False || x = x

andd :: [Bool] -> Bool
andd = foldr (&&) True           -- unit:  True && b = b


-- Every monoid comes with two things: an associative operator, 
-- and an identity specific to that operator.
-- The unit (identity) is the element that when applied to 
-- another one does nothing.
