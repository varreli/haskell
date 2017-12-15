-- use this with new func implementation:

-- unfold :: (b -> Maybe (a, b)) -> b -> [a]



unfold :: (d -> Bool) -> (d -> f) -> (d -> d) -> d -> [f]

unfold p h t x
  | p x       = []
  | otherwise = h x : unfold p h t (t x)


int2bbin :: Integer -> [Integer] 
int2bbin = unfold (== 0) (`mod` 2) (`div` 2)

-- start with:
-- unfold :: a -> b -> c -> d -> e
-- you can get this type just looking at the 
-- first line.

-- then from the second line, you know a few things:

-- (1) p is a function, that returns a Bool and 
-- accepts whatever type x has (d)

-- (2) the result is some kind of list
-- now we have:
-- unfold :: (d -> Bool) -> b -> c -> d -> [f] 
-- for some type f

type Bit = Int

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = mod n 2 : int2bin (n `div` 2)

