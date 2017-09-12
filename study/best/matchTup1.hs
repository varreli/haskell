-- matchingTuples1.hs
module TupleFunctions where

-- These have to be the same type because
-- (+) is a -> a -> a

addEmUp2 :: Num a => (a, a) -> a 
addEmUp2 (x, y) = x + y

-- alternate: 

addEmUp2Alt :: Num a => (a, a) -> a
addEmUp2Alt tup = (fst tup) + (snd tup)

---------------------------------------

fst3 :: (a, b, c) -> a 
fst3 (x, _, _) = x     -- ("blah", 4, [])

third3 :: (a, b, c) -> c
third3 (_, _, x) = x   -- (8, "pooch", [])

k (x, y) = x
k1 = k ((4 - 1), 10)
k2 = k ("mezcla", (1+2))
k3 = k (3, True)

-- λ > :browse TupleFunctions 
-- addEmUp2 :: Num a => (a, a) -> a
-- addEmUp2Alt :: Num a => (a, a) -> a
-- fst3 :: (a, b, c) -> a
-- third3 :: (a, b, c) -> c
-- k :: (t1, t) -> t1
-- k2 :: [Char]
