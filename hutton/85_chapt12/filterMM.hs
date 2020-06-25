import Control.Monad
import Data.Char

filterMM :: Monad m => (a -> m Bool) -> [a] -> m [a]
filterMM p [] = return []
filterMM p (x:xs) = do 
                    b <- p x
                    ys <- filterMM p xs
                    return (if b then x:ys else ys)

powerset = (\x -> [True,False])
-- ghci> filterMM powerset [2,3]
-- [[2,3],[2],[3],[]]



-- READ:

-- https://blog.ssanj.net/posts/2018-04-10-how-does-filterm-work-in-haskell.html
