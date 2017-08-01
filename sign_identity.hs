xyl :: (Fractional a) => a -> a -> a
xyl x y = x / y

λ > xyl 4 5
0.8

λ > :t xyl 4
xyl 4 :: Fractional a => a -> a

λ > :t xyl 4 5
xyl 4 5 :: Fractional a => a

λ > :t xyl 4 id 5
xyl 4 id 5 :: (Num a, Fractional (a -> a)) => a

λ > :t xyl id 4 5
xyl id 4 5 :: (Num a, Fractional (a -> a)) => a

λ > :t xyl id 4 
xyl id 4 :: Fractional (a -> a) => a -> a

-- the last 2 use id as if it were a number,
-- as an argument to (/) ultimately, so 
-- it has the Fractional constraint. ' , ' can
-- be read 'and', the order is not important.
-- The compliler displays it as an artifact
