import Control.Applicative
import Control.Monad

powerset = (\x -> [True,False])

filterMM :: Monad m => (a -> m Bool) -> [a] -> m [a]
filterMM p [] = return []
filterMM p (x:xs) = do 
                    b <- p x
                    ys <- filterMM p xs
                    return (if b then x:ys else ys)




filtM p = scanr (\x -> liftA2 (\flg -> if flg then (x:) else id) (p x)) (pure [])

-- Expanding out the point-free version (uses values acc, accx) :

filtMM p = foldr (\x acc -> liftA2 (\flg1  accx -> if flg1 then (x:accx) else accx) (p x) acc) (pure [])



-- Cale evaluation:
-- http://dpaste.com/05223GW
