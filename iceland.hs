{-# Language InstanceSigs, TypeApplications #-} 

import Data.Functor.Const

newtype Strr a = Strr String
  deriving Show

instance Functor Strr where
  fmap :: (a -> a') -> (Strr a -> Strr a')
  fmap _ (Strr string) = Strr string

instance Applicative Strr where
  pure :: a -> Strr a
  pure _ = Strr ""

  (<*>) :: Strr (a -> b) -> Strr a -> Strr b
  Strr string <*> Strr string' = Strr (string ++ string')
-----------------------------------------------------------
newtype ConstProd a = ConstProd Int      
  deriving Show

instance Functor ConstProd where
  fmap :: (a -> a') -> (ConstProd a -> ConstProd a')
  fmap _ (ConstProd int) = ConstProd int

instance Applicative ConstProd where
  pure :: a -> ConstProd a
  pure _ = ConstProd 1 

  (<*>) :: ConstProd (a -> b) -> ConstProd a -> ConstProd b
  ConstProd int <*> ConstProd int' = ConstProd (int * int')

tt = traverse Strr ["They", " ", "were", " ", "perplexed"]
uu = traverse ConstProd [1..5]

