import Data.List (union)

euler1 = union [3,6..19] [5,10..19]

euler2 = union [2,4..28] [7,14..56]

main = do
	print $ euler1
        print $ euler2

-- The list of all natural numbers below 10 that are multiples 
-- of 3 or 5 are 3, 5, 6 and 9. The sum of these multiples is 23.

-- Find the sum of all the multiples of 3 or 5 below 1000.

