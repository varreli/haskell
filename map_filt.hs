mapper :: (a -> b) -> [a] -> [b]
mapper _ [] = []
mapper f (x:xs) = f x : mapper f xs

fillter :: (a -> Bool) -> [a] -> [a]
fillter _ [] = []
fillter p (x:xs)
    | p x         = x : fillter p xs
    | otherwise = fillter p xs
