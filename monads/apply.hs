import Data.List
import Control.Monad
-- import Data.Foldable

apply :: Monad m => m (a -> b) -> m a -> m b

apply f g =
    do ff <- f
       gg <- g
       return (ff gg)

applly f g = f >>= \ff -> g >>= \gg -> return ff (gg)



-- (apply should work) .. following are the same:

mm = liftM2 ((/) . realToFrac) sum genericLength [4,5,6]
oo = liftM2 ((/) . realToFrac) (foldr (+) 0) genericLength [10,20]

-- https://stackoverflow.com/questions/33454650/understanding-ap-in-a-point-free-function-in-haskell
