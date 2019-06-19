dec2Int :: [Int] -> Int
dec2Int = foldl (\acc x -> acc * 10 + x) 0

curryy :: ((a,b) -> c) -> a -> b -> c
curryy f = \x -> \y -> f (x,y)

uncurryy :: (a -> b -> c) -> ((a,b) -> c)
uncurryy f = \(a,b) -> f x y

