-- note order of generators:

-- λ > [(x, y) | x <- [1,2,3], y <- [6,7]]
-- [(1,6),(1,7),(2,6),(2,7),(3,6),(3,7)]


-- λ > [(x, y) | y <- [6,7], x <- [1,2,3]]
-- [(1,6),(2,6),(3,6),(1,7),(2,7),(3,7)]


concatt :: [[a]] -> [a]
concatt xxs = [x | xs <- xxs, x <- xs]

firsts :: [(a,b)] -> [a]
firsts pairs = [x | (x, _) <- pairs]

lengght :: [a] -> Int
lengght xs = sum [ 1 | _ <- xs]  -- increment is in 2 places: 
                                 -- sum , 1



-- factors used to find prime:

factors :: Int -> [Int]
factors n = [ x | x <- [1..n] , mod n x == 0]

prime :: Int -> Bool
prime n = factors n == [1, n]    


-- λ > prime 15    -- lazy evaluation returns only 3 => False
-- False

primes_to :: Int -> [Int]
primes_to n = [x | x <- [2..n] , prime x]  -- all primes to n

key_value :: Eq a => a -> [(a,b)] -> [b]
key_value k table = [v | (key, v) <- table , k == key]

