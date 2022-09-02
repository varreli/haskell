-- Find the sum of all the multiples of 3 and 5 below 1000. 

-- Note each tail of x and y.

-- The function union discards duplicates.

import Data.List (union)

x = [3,6..999]
y = [5,10..995]

union' = union x y
summa  = print $ foldr (+) 0 union'
