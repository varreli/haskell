dec2Int :: [Int] -> Int
dec2Int = foldl (\v x -> 10 * v + x) 0

