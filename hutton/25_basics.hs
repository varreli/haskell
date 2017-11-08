factt :: Int -> Int
factt n
  | n == 0 = 1
  | otherwise = n * factt (n - 1)


-- simplify and exclude negative inputs: 

facct :: Int -> Int
facct 0 = 1
facct x | x > 0 = x * facct (x - 1)
        | otherwise = 0 


sumdown :: Int -> Int
sumdown n
  | n < 0 = 0
  | otherwise = n + sumdown (n - 1) 

expon :: Int -> Int -> Int
expon n raise
  | raise == 0 = 1
  | n < 0 = 0
  | otherwise = n * expon n (raise - 1) 
