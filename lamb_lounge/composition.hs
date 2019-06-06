module Composition where

compose :: (b -> c) -> (a -> b) -> a -> c
compose f g = (\x -> f (g x))


-- Num a => a -> a

