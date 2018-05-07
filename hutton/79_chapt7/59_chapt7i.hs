
unfold :: (d -> Bool) -> (d -> f) -> (d -> d) -> d -> [f]
unfold p h t x
  | p x       = []
  | otherwise = h x : unfold p h t (t x)


int2bbin :: Integer -> [Integer] 
int2bbin = unfold (== 0) (`mod` 2) (`div` 2)

-- This returns an array.
-- In an array, it's more natural to write 10 as 

-- [0,1,0,1] 

-- because the array elements correspond to
-- coefficients. indices correspond 
-- to the powers of two; and 1010b is for human
-- processing.

-- coefficients c_i in the following: 
-- c_0*2^0 + c_1*2^1 + ... c_n*2^n
