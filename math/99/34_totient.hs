-- 2 elegant ways to calculate Euler's totient function phi(m).

-- Euler's totient function phi(m) is defined
-- as the number of positive integers 

-- r (1 <= r < m) 

--that are coprime to m.


totient 1 = 1
totient n = length $ filter (coprime n) [1..(n-1)]
 where coprime a b = gcd a b == 1

totient' n = length [x | x <- [1..n], coprime x n]
  where coprime a b = gcd a b == 1
