fillter :: (a -> Bool) -> [a] -> [a]
fillter p xs = [ x | x <- xs, p x ]

filterr :: (a -> Bool) -> [a] -> [a]
filterr p [] = []
filterr p (x:xs)
  | p x = x : filterr p xs
  | otherwise = filterr p xs


> filter (/= ' ') 'a'
True
> filter (/= ' ') ' '
False


-- (/= ' ') means: if the list element currently 
-- being tested is a space, return False; otherwise True'

-- then it keeps only the list elements for which 
-- the predicate was True .  Note filter means "keep"
