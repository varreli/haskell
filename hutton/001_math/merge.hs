-- Define a recursive function that merges 
-- two lists to give a single sorted list :

merger :: Ord a => [a] -> [a] -> [a]

merger xs [] = xs
merger [] ys = ys
merger (x:xs) (y:ys) 
  | x < y    = x : merger xs (y : ys)
  | otherwise = y : merger (x : xs) ys

