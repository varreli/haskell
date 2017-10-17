abss :: (Ord a, Num a) => a -> a
abss x
  | x >= 0 = x
  | otherwise = (- x)
