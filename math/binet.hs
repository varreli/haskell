-- 2 versions of binet's formula to find nth fibonacci:

fib n = round $ phi ** fromIntegral n / sq5
  where
    sq5 = sqrt 5 :: Double
    phi = (1 + sq5) / 2


fib' n = (binet - binet') / (sqrt 5)
    where
      binet   = ((1 + sqrt 5) /2) ^ n 
      binet'  = ((1 - sqrt 5) /2) ^ n 


-- two standard haskell ways to find fibonaccis:

fibs = take 10 (let x = 1 : 1 : zipWith (+) x (tail x) in x)

fibby = takeWhile (< 144) x
  where x = 1 : 1 : zipWith (+) x (tail x)
