factt :: Int -> Int
factt n
  | n == 0 = 1
  | otherwise = n * factt (n - 1)


-- simplify and exclude negative inputs: 

facct :: Int -> Int
facct 0 = 1
facct x | x > 0 = x * facct (x - 1)
        | otherwise = 0 
