-- DO NOT RUN - All number theory algorithms 
-- ultimately come down to Euclid's algorithm

import Debug.Trace

extendEu :: Integer -> Integer -> (Integer, Integer)
extendEu a b | traceShow (a, b) False = undefined

extendEu a 0 = (1, 0)
extendEu a b = (t, s - q * t)
  where (q, r) = quotRem a b
        (s, t) = extendEu b r



-- we remove where clauses when we substitute the variables they define.
-- i.e. we separate the evaluation steps and substitution steps


(1)
extendEu 80 62 = (t, s - q * t) where (q, r) = quotRem 80 62 ; (s, t) = extendEu 62 r
extendEu 80 62 = (t, s - q * t) where (q, r) = (1, 18) ; (s, t) = extendEu 62 r
extendEu 80 62 = (t, s - 1 * t) where (s, t) = extendEu 62 18


(2)
extendEu 62 18 = (t, s - q * t) where (q, r) = quotRem 62 18 ; (s, t) = extendEu 18 r
extendEu 62 18 = (t, s - q * t) where (q, r) = (3, 8) ; (s, t) = extendEu 18 r
extendEu 62 18 = (t, s - 3 * t) where (s, t) = extendEu 18 8


(3)
extendEu 18 8 = (t, s - q * t) where (q, r) = quotRem 18 8 ; (s, t) = extendEu 8 r
extendEu 18 8 = (t, s - q * t) where (q, r) = (2, 2) ; (s,t) = extendEu 8 r
extendEu 18 8 = (t, s - 2 * t) where (s, t) = extendEu 8 2


(4)
extendEu 8 2 = (t, s - q * t) where (q, r) = quotRem 8 2 ; (s, t) = extendEu 2 r
extendEu 8 2 = (t, s - q * t) where (q, r) = (4,0) ; (s, t) = extendEu 2 r
extendEu 8 2 = (t, s - 4 * t) where (s, t) = extendEu 2 0


extendEu 2 0 = (1, 0)        -- base case


(4)
extendEu 8 2 = (t, s - 4 * t) where (s, t) = extendEu 2 0
extendEu 8 2 = (t, s - 4 * t) where (s, t) = (1, 0)
extendEu 8 2 = (0, 1 - 4 * 0)
extendEu 8 2 = (0, 1)

(3)
extendEu 18 8 = (t, s - 2 * t) where (s, t) = extendEu 8 2
extendEu 18 8 = (t, s - 2 * t) where (s, t) = (0, 1)
extendEu 18 8 = (1, 0 - 2 * 1)
extendEu 18 8   = (1, -2)

(2)
extendEu 62 18 = (t, s - 3 * t) where (s, t) = extendEu 18 8
extendEu 62 18 = (t, s - 3 * t) where (s, t) = (1, -2)
extendEu 62 18 = (-2, 1 - (3 * -2))
extendEu 62 18 = (-2, 7)

(1)
extendEu 80 62 = (t, s - 3 * t) where (s, t) = extendEu 62 18
extendEu 80 62 = (t, s - 1 * t) where (s, t) = (-2, 7)
extendEu 80 62 = (7, -2 - 1 * 7)
extendEu 80 62 = (7, -9)



-- https://math.stackexchange.com/questions/85830/how-to-use-the-extended-euclidean-algorithm-manually
