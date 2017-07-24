import Debug.Trace

divides :: Integer -> Integer -> Bool
divides d n | trace ("divides: " ++ show (d, n)) False = undefined
divides d n = rem n d == 0

ldf :: Integer -> Integer -> Integer
ldf k n     | trace ("ldf: " ++ show (k, n)) False = undefined
ldf k n     | divides k n = k
            | k^2 >= n = n
            | otherwise = ldf (k+1) n

ld :: Integer -> Integer
ld n        | trace ("ld: " ++ show n) False = undefined
ld n = ldf 2 n

factors :: Integer -> [Integer]
factors n   | trace ("factors: " ++ show n) False = undefined
factors n   | n < 1 = error "argument not positive"
            | n == 1 = []
            | otherwise = p : factors (div n p) where p = ld n

main = print (factors 5390)
