divides :: Integer -> Integer -> Bool
divides d n = rem n d == 0

ldf :: Integer -> Integer -> Integer
ldf k n     | divides k n = k
            | k^2 > n = n
            | otherwise = ldf (k+1) n

ld :: Integer -> Integer
ld n = ldf 2 n

primeO :: Integer -> Bool
primeO n    | n < 1    = error "not a positive integer"
            | n == 1   = False
            | otherwise  = ld n == n

main = print $ map primeO [2011, 2013, 2015, 2017, 2019, 2021, 2023] -- use of map

-- no need to use = in k^2 >= n = n  .  divides k n = k 
-- covers k ^ 2 = n , since k AND k^2 would both divide n.
