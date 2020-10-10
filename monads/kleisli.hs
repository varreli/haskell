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

qq = (/2) . (*100)
uu = (flip (.)) (/2) (*100) 


-- note average is (a -> b) ------------------------------
average :: [Double] -> Double

average n = sum n / fromIntegral (length n)

-- review now! :
-- https://www.schoolofhaskell.com/user/Lkey/kleisli

-- solutions to category theory for the programmer:
-- http://danshiebler.com/2018-11-10-category-solutions/
