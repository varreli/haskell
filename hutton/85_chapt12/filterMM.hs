import Control.Monad
import Data.Char

filterMM :: Monad m => (a -> m Bool) -> [a] -> m [a]
filterMM f [] = return []
filterMM f (x:xs) = do 
                    b <- f x
                    ys <- filterMM f xs
                    return (if b then x:ys else ys)

powerset = (\x -> [True,False])
-- ghci> filterMM powerset [2,3,4]
