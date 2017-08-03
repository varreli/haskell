λ > let myCompare x = x > (length [1..12])

λ > :t myCompare 
myCompare :: Int -> Bool

λ > myCompare 44
True

λ > :t myCompare 44
myCompare 44 :: Bool



λ > :t (>)
(>) :: Ord a => a -> a -> Bool

-- Int is an instance of Ord.
-- If something is already an instance, the 
-- interpreter will not show the constraint. 
-- Ord is defined as class Eq a => Ord a

-- so you always know that if something is Ord, 
-- it's also Eq. So you don't ever need to say 
--    (Eq a, Ord a) => 
--    only    Ord a =>
