removeFst :: Eq a => a -> [a] -> [a]
removeFst x        [] = []
removeFst x (y:ys) | x == y = ys
                   | otherwise = y : removeFst x ys

sorter :: [Int] -> [Int]
sorter [] = []
sorter xs = m : (sorter (removeFst m xs)) where m = minimum xs

-- main = print $ sorter [7,2,3,8,1,0,4]
main = print $ removeFst 4 [2,4,17,5,4,10]
