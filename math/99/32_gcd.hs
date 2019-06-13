-- Determine the gcd of two positive integer numbers. 
-- Use Euclid's algorithm.

import Debug.Trace

gcd' 0 y = y
gcd' x y = gcd' (y `mod` x) x
myGCD x y | x < 0     = myGCD (-x) y
          | y < 0     = myGCD x (-y)
          | y < x     = gcd' y x
          | otherwise = gcd' x y


-- euclids finds the GCD greatest common divisor 
-- (greatest common factor)


euclid :: Int -> Int -> Int
euclid s t | traceShow (s, t) False = undefined
euclid s t
  | s <= 0, t <= 0 = 0
  | s == t = s
  | s < t = euclid s ( t - s )
  | s > t = euclid ( s - t ) t

--  λ > euclid 216 594
-- (216,594)
-- (216,378)
-- (216,162)
-- (54,162)
-- (54,108)
-- (54,54)
-- 54
