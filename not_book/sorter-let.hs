removeFst :: Eq a => a -> [a] -> [a]
removeFst x        [] = []
removeFst x (y:ys) | x == y = ys
                   | otherwise = y : removeFst x ys

sorter2 :: [Int] -> [Int]
sorter2 [] = []
sorter2 xs = let                                  -- uses let construction
              m = minimum xs
            in m : (sorter2 (removeFst m xs))

main = print $ sorter2 [7,2,3,8,1,33,0,4]
