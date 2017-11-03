insertt :: Ord a => a -> [a] -> [a]
insertt x [] = [x]
insertt x (y:ys) | x <= y = x : y : ys
                | otherwise = y : insertt x ys

isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insertt x (isort xs)


zip :: [a] -> [b] -> [(a, b)]
zip [] _ = []
zip _ [] = []
zip (x:xs) (y:ys) = (x, y) : zip xs ys

drop :: Int -> [a] -> [a]
drop 0 xs = xs
drop _ [] = []
drop n (_:xs) = drop (n - 1) xs

-- In the case of drop, you never actually use 
-- the first element of the list, so we use the
-- wild card on line 4. It is identical to (x:xs)
