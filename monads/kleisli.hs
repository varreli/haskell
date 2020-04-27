-- {-# LANGUAGE FlexibleContexts #-}

import Data.Char
import Control.Monad

-- note average is (a -> b)
average :: [Double] -> Double

average n = sum n / fromIntegral (length n)

(|>) :: (a -> b) -> (b -> c) -> (a -> c)
(|>) = flip (.)

vv = map toLower |> map toUpper -- |> map toLower


ff = ?
gg = ? 


(!>) :: (Num a, Monad m) => (a -> m b) -> (b -> m c) -> (a -> m c)
(!>) f g = f |> fmap g |> join 



-- review now! :
-- https://www.schoolofhaskell.com/user/Lkey/kleisli



-- solutions to category theory for the programmer:
-- http://danshiebler.com/2018-11-10-category-solutions/
