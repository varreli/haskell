import Debug.Trace

euclid :: Int -> Int -> Int
euclid s t | traceShow (s, t) False = undefined

euclid s 0 = s
euclid s t = euclid t (mod s t)


-- > euclid 6 27

--   euclid 27 6
--   euclid 6 3 
--   euclid 3 0
--   3

-- study this as as example of quotient types.
-- Haskell does not have them, but research similar.

