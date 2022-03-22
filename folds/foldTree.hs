{-# LANGUAGE DeriveFoldable #-}

data Tree a
  = Null 
  | Node a (Tree a) (Tree a)
  deriving (Foldable, Show)

isMember :: Int -> Tree Int -> Bool
isMember = elem
