palin :: Eq a => [a] -> Bool
palin xs
  | xs == reverse xs = True
  | otherwise = False

-- note signature, this can take 
-- arguments of type Eq a => [a]
