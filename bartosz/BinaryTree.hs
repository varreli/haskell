module BinaryTree where

-- Haskell Binary Tree Examples

-- A binary tree can either be empty or a node with a left and right branch

data Tree a = EmptyTree | Node a (Tree a) (Tree a)
  deriving ( Show, Read, Eq )

singleton :: a -> Tree a  
singleton x = Node x EmptyTree EmptyTree  
  
insert :: (Ord a) => a -> Tree a -> Tree a  
insert x EmptyTree = singleton x  
insert x (Node a left right)   
    | x == a = Node x left right  
    | x < a  = Node a (insert x left) right  
    | x > a  = Node a left (insert x right)  

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False  
treeElem x (Node a left right)  
    | x == a = True  
    | x < a  = treeElem x left  
    | x > a  = treeElem x right  

-- (a -> b) -> Tree a -> Tree b
instance Functor Tree where  
  fmap f EmptyTree = EmptyTree  
  fmap f (Node x leftsub rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)  

-- Helper function to make a binary tree structure

makeTree :: (Ord a) => [a] -> Tree a
makeTree xs = foldr insert EmptyTree xs

-- tree size $ makeTree [1,2,3] The number of elements in the binary tree
treeSize :: Num a => Tree t -> a
treeSize EmptyTree = 0
treeSize (Node _ left right) = 1 + treeSize left + treeSize right

-- In a binary tree the smallest item is the item furthest left
minTreeValue :: Tree t -> t
minTreeValue (Node x EmptyTree _) = x
minTreeValue (Node x leftBranch _) = minTreeValue leftBranch

-- In a binary tree the largest item is the item furthest right
maxTreeValue :: Tree t -> t
maxTreeValue (Node x _ EmptyTree) = x
maxTreeValue (Node x _ rightBranch) = maxTreeValue rightBranch

-- Returns the sum of all items in a numerical binary tree
treeSum :: Num a => Tree a -> a
treeSum EmptyTree = 0
treeSum (Node x left right) = x + (treeSum left) + (treeSum right)

-- A function that returns the product of all values in the tree
treeToList :: Tree a -> [a]
treeToList EmptyTree = []
treeToList (Node x leftBranch rightBranch) = x : a ++ b
  where a = (treeToList leftBranch)
        b = (treeToList rightBranch)

treeProduct :: Num a => Tree a -> a
treeProduct EmptyTree = 0
treeProduct (Node x left right) = foldr (*) 1 $ treeToList (Node x left right)

-- Returns the height of a binary tree
treeHeight :: Tree a -> Int
treeHeight EmptyTree = 0
treeHeight (Node _ leftBranch rightBranch) = 1 + max (treeHeight leftBranch) (treeHeight rightBranch)
