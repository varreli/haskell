import Data.Char
import Control.Monad


(|>) :: (a -> b) -> (b -> c) -> (a -> c)
(|>) = flip (.)
---------------------------------------------------------
-- Left-to-right Kleisli composition of monads:

(!>) :: Monad m => (a -> m b) -> (b -> m c) -> (a -> m c)
(!>) f g = f |> fmap g |> join 

-- same type: -----------------

(!!>) f g = join . (fmap g) . f

-- using bind to define fish: ----------------------------

(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> (a -> m c)
f >=> g = \x -> f x >>= g


vv = map toLower |> map toUpper
ww = (|>) (map toLower) (map toUpper) 


xx = (map toLower) . (map toUpper)
yy = (map toUpper) . (map toLower)


qq = (/2) . (*100)
uu = (flip (.)) (/2) (*100) 


-- note average is (a -> b) ------------------------------
average :: [Double] -> Double

average n = sum n / fromIntegral (length n)


-- note section on haskell (f# question) :
-- https://stackoverflow.com/questions/30110964/what-f-sorcery-is-this 

-- review now! :
-- https://www.schoolofhaskell.com/user/Lkey/kleisli

-- solutions to category theory for the programmer:
-- http://danshiebler.com/2018-11-10-category-solutions/
