import Debug.Trace

divides :: Integer -> Integer -> Bool
divides d n = rem n d == 0

ldf :: Integer -> Integer -> Integer
ldf k n   | divides k n = k
            | k^2 >= n = n
            | otherwise = ldf (k+1) n

ld :: Integer -> Integer
ld n = ldf 2 n

factors :: Integer -> [Integer]
factors n | n < 1 = error "argument not positive"
          | n == 1 = []
          | traceShow n otherwise = p : factors (div n p) where p = ld n

main = do
  print (factors 99)
  print (factors 5390)
  print (factors 5266)

-- main = print (factors 99) >> print (factors 5390) >> print (factors 5266) 

-- we are making a list where the first element is ld n, or p
-- and the remainder is factors (div n p)
-- the `:` function is used to construct lists, so the result of p is consed onto the list:
-- prelude> 5:[4,3]
-- [5,4,3]
