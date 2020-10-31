lengthy = length' where
    length' l [] = 0 
    length' l (_:xs) = length' (1+l) xs

squarre :: Int -> (Int -> r) -> r
squarre x = \k -> k (x^2) 
