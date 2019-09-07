-- euclids finds the GCD greatest common divisor 
-- (greatest common factor)

import Debug.Trace

euclid :: Int -> Int -> Int
euclid s t | traceShow (s, t) False = undefined
euclid s t
  | s <= 0 || t <= 0 = error "Works for positive numbers only" 
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


----------------------------------------------------------------

-- n = qm + r :

-- λ > 43 == (7*6) + 1
-- True

-- This is the same as the result of a long division

-- In euclid
-- both numbers are formed by adding some multiples of the 
-- original numbers. Thus there are some numbers, a and b, 
-- such that 

-- gcd(n,m) = (a * n) + (b * m)  

-- The Extended Euclidean algorithm can recover not only 
-- gcd(n,m), but also these numbers a and b.
