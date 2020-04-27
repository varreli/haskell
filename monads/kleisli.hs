import Data.Char
import Control.Monad


(|>) :: (a -> b) -> (b -> c) -> (a -> c)
(|>) = flip (.)


(!>) :: (a -> m b) -> (b -> m c) -> (a -> m c)
(!>) f g = f |> fmap g |> join 



vv = map toLower |> map toUpper -- |> map toLower

-- note average is (a -> b)
average :: [Double] -> Double

average n = sum n / fromIntegral (length n)

-- review now! :
-- https://www.schoolofhaskell.com/user/Lkey/kleisli



-- solutions to category theory for the programmer:
-- http://danshiebler.com/2018-11-10-category-solutions/
