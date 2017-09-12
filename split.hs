split :: Ord a => a -> [a] -> ([a],[a])
split x [] = ([], [])

split x (y:ys)
  | y < x       = (y:less, greater)
  | otherwise   = (less, y:greater)
                where (less, greater) = split x ys
