-- concatenate a list of lists:

concatt :: [[a]] -> [a]
concatt [] = []
concatt (xs:xss) = xs ++ concatt xss

-- produce a list of n identical elements:

repllicate :: Int -> a -> [a]
repllicate 0 _ = []
repllicate n x = x : repllicate (n - 1) x

-- select the nth element of a list:

(!!>) :: [a] -> Int -> a
(!!>) (x:xs) 0 = x 
(!!>) (x:xs) n = (!!>) xs (n - 1)

-- decide if a value is an element of a list:

elemm :: Eq a => a -> [a] -> Bool
elemm _ [] = False
elemm a (x:xs) =
  if a == x
    then True
  else elemm a xs

