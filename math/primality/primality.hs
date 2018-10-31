module Main where
divides :: Integer -> Integer -> Bool

divides d n = rem n d == 0

ldf k n     | divides k n = k
            | k^2 >= n = n
            | otherwise = ldf (k+1) n


ld n = ldf 2 n

primeO :: Integer -> Bool
primeO n | n < 1    = error "not a positive integer"
         | n == 1   = False
         | otherwise  = ld n == n

main = print $ map primeO [3,6,13,91,131,140]  -- use of map


-- Is (n^2 + n + 41) prime for all Naturals n ?

-- No, Euclid found this to be True up to 39 :

-- (41^2 + 41 + 41) = 41(42) + 41 = 42 * 42    -- not prime

-- and:

-- (40^2 + 40 + 41) = 40(41) + 41 = 41 * 41    -- not prime

-- So, (n^2 + n + 41) is prime for all n is :         False

