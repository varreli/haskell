import Data.List
import Data.Char

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

tree = Node (Leaf "abc") (Node (Leaf "rst") (Node (Leaf "hij") (Leaf "qrst")))

instance Functor Tree where
-- ffmap :: (a -> b) -> Tree a -> Tree a
ffmap g (Leaf x) = Leaf (g x)
ffmap g (Node l r) = Node (ffmap g l) (ffmap g r) 
 
oo = ffmap (map toUpper) (ffmap (intersperse '-') tree)
pp = ffmap length tree

