mem, mem' :: Eq a => a -> [a] -> Bool

mem x lst = any (== x) lst
mem'      = any . (==)
