data Tree a = Empty | Leaf a | Node a (Tree a) (Tree a) deriving Show
t = Node 5 (Leaf 10) (Node 6 (Leaf 11) (Empty))

instance Functor Tree where
  fmap f Empty = Empty
  fmap f (Leaf x) = Leaf (f x)
  fmap f (Node a left right) = Node (f a) (fmap f left) (fmap f right)



