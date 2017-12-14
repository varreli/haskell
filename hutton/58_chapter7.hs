dec2Int :: [Int] -> Int
dec2Int = foldl (\acc x -> acc * 10 + x) 0

curryy :: ((a,b) -> c) -> a -> b -> c
curryy ff = \x -> \y -> f (x,y)

uncurryy :: (a -> b -> c) -> ((a,b) -> c)
uncurryy f = \(a,b) -> f x y

unfold p h t x
  | p x       = []
  | otherwise = h x : unfold p h t (t x)


-- start with:
-- unfold :: a -> b -> c -> d -> e
-- you can get this type just looking at the 
-- first line.

-- then from the second line, you know a few things:

-- (1) p is a function, that returns a Bool and 
-- accepts whatever type x has (d)

-- (2) the result is some kind of list
-- now we have:
-- unfold :: (d -> Bool) -> b -> c -> d -> [f] 
-- for some type f
