import Data.Char
import Control.Monad


(|>) :: (a -> b) -> (b -> c) -> (a -> c)
(|>) = flip (.)


(!>) :: Monad m => (a -> m b) -> (b -> m c) -> (a -> m c)
(!>) f g = f |> fmap g |> join 



vv = map toLower |> map toUpper
ww = (|>) (map toLower) (map toUpper) 

xx = (map toLower) . (map toUpper)
yy = (map toUpper) . (map toLower)

