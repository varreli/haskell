xyl :: (Fractional a) => a -> a -> a
xyl x y = x / y

-- λ > xyl 4 5
-- 0.8

-- λ > :t xyl 4
-- xyl 4 :: Fractional a => a -> a

-- λ > :t xyl 4 5
-- xyl 4 5 :: Fractional a => a

-- λ > :t xyl 4 id 5
-- xyl 4 id 5 :: (Num a, Fractional (a -> a)) => a

-- λ > :t xyl id 4 5
-- xyl id 4 5 :: (Num a, Fractional (a -> a)) => a

-- This needs (Num a .. ) so that it can convert the
-- literal 5 to an 'a'

-- λ > :t xyl id 4
-- xyl id 4 :: Fractional (a -> a) => a -> a

-- 'xyl id 4' applies xyl to id; it then applies
-- the result of that to 4.

-- compare :

-- λ > :t (/) id 4
-- (/) id 4 :: Fractional (a -> a) => a -> a

-- λ > :t (/) (id 4)
-- (/) (id 4) :: Fractional a => a -> a
