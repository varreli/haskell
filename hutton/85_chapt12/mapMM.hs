import Control.Monad
import Data.Char

mapMM :: Monad m => (a -> m b) -> [a] -> m [b] 
mapMM f [] = return []
mapMM f (x:xs) = do y <- f x
                    ys <- mapMM f xs 
                    return (y:ys)

-- Note the return type m [b] 
-- This will return a nested list:  [] : [b]  --> [[b]]

conv :: Char -> Maybe Int
conv c | isDigit c = Just (digitToInt c)
       | otherwise = Nothing

-- ghci> mapMM conv "123"
-- Just [1,2,3]

-- ghci> mapMM conv "12a"
-- Nothing
