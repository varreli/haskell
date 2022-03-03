import Data.List
import Control.Monad
-- import Data.Foldable

mm = liftM2 ((/) . realToFrac) sum genericLength [4,5,6]

nn = liftM2 ((/) . realToFrac) (foldr (+) 0) genericLength [10,20]
