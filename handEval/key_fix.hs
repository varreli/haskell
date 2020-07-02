fixx :: (t -> t) -> t
fixx f = f (fixx f)
 
---------------------------------------------------------------

factorial :: Int -> Int           -- see hand eval: fixpoint.hs
factorial = fixx factt

factt = (\f n -> if (n <= 1) then 1 else n * f (n - 1))

-- also:

fact = fixx fac
   where
     fac f 0 = 1
     fac f x = x * f (x - 1)

---------------------------------------------------------------

cosine = fixx coss

coss :: (Double -> Double) -> Double -> Double       
--      (Double -> Double) is f, the lambda:
coss = (\f x -> if x == cos x then x else f (cos x)) 


-- monadic fixx:   --------------------------------------------

ioFix = fixx io

io :: (Integer -> IO Integer) -> Integer -> IO Integer
io = (\f x -> if x >= 0 then do print x; f (x - 1) else pure x)

-- ghci> ioFix 3

-- 3               |
-- 2               |   side effects
-- 1               |
-- 0               |
--  -1                 -- output of recursion (x >= 0) 

-- https://www.parsonsmatt.org/2016/10/26/grokking_fix.html
