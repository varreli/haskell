import Data.List (union)

euler1 = sum (union [3,6..999] [5,10..999])

main = print $ prob_1


-- The list of all natural numbers below 10 that are multiples 
-- of 3 or 5 are 3, 5, 6 and 9. The sum of these multiples is 23.

-- Find the sum of all the multiples of 3 or 5 below 1000.

