-- λ > [(x, y) | x <- [1,2,3], y <- [6,7]]
-- [(1,6),(1,7),(2,6),(2,7),(3,6),(3,7)]


-- λ > [(x, y) | y <- [6,7], x <- [1,2,3]]
-- [(1,6),(2,6),(3,6),(1,7),(2,7),(3,7)]

concatt :: [[a]] -> [a]
concatt xxs = [x | xs <- xxs, x <- xs]

firsts :: [(a,b)] -> [a]
firsts pairs = [x | (x, _) <- pairs]

lengght :: [a] -> Int
lengght xs = sum [ 1 | _ <- xs]

