mapp :: (a -> b) -> [a] -> [b]
mapp _ [] = []
mapp f (x:xs) = f x : mapp f xs

filterr :: (a -> Bool) -> [a] -> [a]
filterr _ [] = []
filterr p (x:xs)
    | p x         = x : filterr p xs
    | otherwise = filterr p xs
