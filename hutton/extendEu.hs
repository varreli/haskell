import Debug.Trace

extendEu :: Integer -> Integer -> (Integer, Integer)
extendEu a b | traceShow (a, b) False = undefined

extendEu a 0 = (1, 0)
extendEu a b = (t, s - q * t)
  where (q, r) = quotRem a b;
              (s, t) = extendEu b r
