applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b

applyTimes 0 f b = b
applyTimes n f b = f . applyTimes (n - 1) f $ b


-- incTimes :: (Eq a, Num a) => a -> a -> a
-- incTimes times n = applyTimes times ( + 1 ) n




-- λ > :t applyTimes 5 (+ 1)
-- applyTimes 5 (+ 1) :: Num b => b -> b

-- λ > :t ((+ 1) `asTypeOf`) id :: Num a => a -> a
-- ((+ 1) `asTypeOf`) id :: Num a => a -> a :: Num a => a -> a

-- λ > :t (applyTimes 5 (+ 1) `asTypeOf`) id
-- (applyTimes 5 (+ 1) `asTypeOf`) id :: Num b => b -> b



-- note difference in error messages:

-- λ > :t (+) :: Num a => a -> a
-- Couldn't match type 'b1' with 'b1 -> b1'

-- λ > :t ((+) `asTypeOf`) id
-- Occurs check: cannot construct the infinite 
-- type: a ~ a -> a

