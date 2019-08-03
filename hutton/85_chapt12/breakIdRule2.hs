{-# LANGUAGE InstanceSigs #-}

data List a = Nil | Cons a (List a) deriving Show

instance Functor List where
    fmap :: (a -> b) -> List a -> List b
    fmap _ Nil = Nil
    fmap g xs = Nil
