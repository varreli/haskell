filterFr, filterR :: (a -> Bool) -> [a] -> [a]
 
filterR _ [] = []
filterR p (x:xs) | p x       = x : filterR p xs
                  | otherwise = filterR p xs


filterFr p = foldr (\x xs -> if p x then x : xs else xs) []  
