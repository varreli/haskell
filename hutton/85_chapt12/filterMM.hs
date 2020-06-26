import Control.Applicative
import Control.Monad

powerset = (\x -> [True,False])           -- powerset function

filterMM :: Monad m => (a -> m Bool) -> [a] -> m [a]
filterMM p [] = return []
filterMM p (x:xs) = do 
                    b <- p x
                    ys <- filterMM p xs
                    return (if b then x:ys else ys)




filtM p = foldr (\x -> liftA2 (\flg -> if flg then (x:) else id) (p x)) (pure [])

-- Expanding out the point-free version (uses values acc, accx) :

filtMM p = foldr (\x acc -> liftA2 (\flg1  accx -> if flg1 then (x:accx) else accx) (p x) acc) (pure [])


-- applicative version with foldr, on list [4,5] :

------------------------

-- For the value of 5:

-- x = 5
-- acc = [[]]
-- flags = [True, False]

------------------------
-- accx []
-- flg1 True
-- result = 5:[] => [5]
------------------------
-- accx []
-- flg1 False
-- result => []

-- newacc = [[5], []]

------------------------

-- For the value of 4:

-- x = 4
-- acc = [[5], []]
-- flags = [True, False]

------------------------
-- accx [5]
-- flg1 True
-- result = 4:[5] => [4,5]
------------------------
-- accx []
-- flg1 True
-- result = 4:[] => [4]
------------------------
-- accx [5]
-- flg1 False
-- result => [5]
------------------------
-- accx []
-- flg1 False
-- result => []
-------------------------------

-- newacc = [[4,5],[4],[5], []]
