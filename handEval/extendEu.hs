import Debug.Trace

extendEu :: Integer -> Integer -> (Integer, Integer)
extendEu a b | traceShow (a, b) False = undefined

extendEu a 0 = (1, 0)
extendEu a b = (t, s - q * t)
  where (q, r) = quotRem a b
        (s, t) = extendEu b r

execute = print $ extendEu 80 62

-- all number theory algorithms ultimately come 
-- down to Euclid's algorithm

-- https://math.stackexchange.com/questions/85830/how-to-use-the-extended-euclidean-algorithm-manually
