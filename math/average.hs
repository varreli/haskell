 average :: [Int] -> Float
 average [] = error "empty list"
 average xs = fromIntegral (sum xs) / fromIntegral (length xs)
 
 main = print $ average [4, 210, 100, 3, 14]
