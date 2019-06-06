-- Calculate Euler's totient function phi(m).

-- Euler's totient function phi(m) is defined
-- as the number of positive integers 

-- r (1 <= r < m) 

--that are coprime to m.


totient 1 = 1
totient a = length $ filter (coprime a) [1..a-1]
 where coprime a b = gcd a b == 1


