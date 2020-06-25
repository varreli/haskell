import Control.Monad
import Data.Char

filterMM :: Monad m => (a -> m Bool) -> [a] -> m [a]
filterMM p [] = return []
filterMM p (x:xs) = do 
                    tru <- p x
                    ys <- filterMM p xs
                    return (if tru then x:ys else ys)

powerset = (\x -> [True,False])
-- ghci> filterMM powerset [2,3]
