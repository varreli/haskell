merger :: Ord a => [a] -> [a] -> [a]

merger xs [] = xs
merger [] ys = ys
merger (x:xs) (y:ys) 
  | x < y     = x : merger xs (y : ys)
  | otherwise = y : merger (x : xs) ys


halves :: [a] -> ([a], [a]) 
halves xs = ((take n xs), (drop n xs))
  where n = div (length xs) 2

mSort :: Ord a => [a] -> [a] 

mSort [] = []
mSort [x] = [x]
mSort xs = merger (mSort first) (mSort second)
  where 
    (first, second) = halves xs  -- see merger
