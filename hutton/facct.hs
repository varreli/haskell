facct :: Int -> Int
facct 0 = 1
facct n | n > 0 = n * facct (n - 1)
