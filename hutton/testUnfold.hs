
unfold :: (d -> Bool) -> (d -> f) -> (d -> d) -> d -> [f]

unfold p h t x
  | p x       = []
  | otherwise = h x : unfold p h t (t x)


int2bbin :: Integer -> [Integer] 
int2bbin = reverse . unfold (== 0) (`mod` 2) (`div` 2)

-- in an array, it's more natural to write 10 as 
-- [0,1,0,1] because the array indices correspond 
-- to the powers of two; and 1010b is for human
-- processing. Array indices correspond to 
-- coefficients.
