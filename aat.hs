data Tree a = Empty | Node a (Tree a) (Tree a)
  deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x Empty Empty

insertT :: (Ord a) => a -> Tree a -> Tree a
insertT x Empty = singleton x

insertT x (Node a left right)
    | x == a = Node x left right
    | x < a  = Node a (insertT x left) right
    | x > a  = Node a left (insertT x right)

tElem :: (Ord a) => a -> Tree a -> Bool
tElem x Empty = False
tElem x (Node a left right)
    | x == a = True
    | x <  a = tElem x left
    | x >  a = tElem x right
