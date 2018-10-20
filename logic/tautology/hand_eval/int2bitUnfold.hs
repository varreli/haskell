type Bit = Int

unfold p h t x
  | p x = []
  | otherwise = h x : unfold p h t (t x)


int2bit :: Int -> [Bit]
int2bit = unfold (== 0) (`mod` 2) (`div` 2)

-- int2bit = (5 `mod` 2)         : unfold p h t        (5 `div` 2)  
-- int2bit =           1 :         unfold p h t                 2
-- int2bit = 1 : (2 `mod` 2)     : unfold p h t        (2 `div` 2)
-- int2bit = 1 : 0 :               unfold p h t                 1
-- int2bit = 1 : 0 : (1 `mod` 2) : unfold p h t        (1 `div` 2)
-- int2bit = 1 : 0 : 1           : unfold p h t                 0
-- int2bit = 1 : 0 : 1 : []
-- > [1,0,1]
