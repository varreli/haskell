-- class Applicative m => Monad m where
--   return :: a -> m a
--   (>>=) :: m a -> (a -> m b) -> m b

-- (>>) :: [a] -> [b] -> [b]

-- instance Monad [] where
-- (>>=) :: [a] -> (a -> [b]) -> [b]
-- xs >>= f = [y | x <- xs, y <- f x]


-- examples of list monad:

-- λ > (>>=) [1..3] (\x -> [x-1,x,x+1] 
-- λ > [1..3] >>= \x -> [x*5, x*5, 10^x]  


pairs :: [a] -> [b] -> [(a,b)]
pairs xs ys = do x <- xs             -- [a] -> (a -> [b])  -- (>>=) extracts
                 y <- ys             -- [a] -> (a -> [b])  -- on each line
                 return (x,y)

-- Desugars to --

pairs' :: [a] -> [b] -> [(a,b)]
pairs' xs ys =
  xs >>= \x ->
  ys >>= \y ->
  return (x,y)

-- Expanded, without sugar --

pairs'' :: [a] -> [b] -> [(a,b)]
pairs'' xs ys = xs >>= \x -> ys >>= \y -> return (x,y)
--              |      |     |      |     `- [(a,b)] -'
--              |      |    [b] >>= `b ->    [(a,b)] -'
--             [a] >>= `a ->                 [(a,b)] -'



-- https://www.schoolofhaskell.com/school/starting-with-haskell/basics-of-haskell/13-the-list-monad

