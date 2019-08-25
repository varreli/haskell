pairs :: [a] -> [b] -> [(a,b)]
pairs xs ys = do x <- xs
                 y <- ys
                 return (x,y)


-- https://www.schoolofhaskell.com/school/starting-with-haskell/basics-of-haskell/13-the-list-monad
