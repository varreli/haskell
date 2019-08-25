
-- instance Monad [] where
-- (>>=) :: [a] -> (a -> [b]) -> [b]
-- xs >>= f = [y | x <- xs, y <- f x]

pairs :: [a] -> [b] -> [(a,b)]
pairs xs ys = do x <- xs
                 y <- ys
                 return (x,y)

