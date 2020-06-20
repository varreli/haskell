-- module Main where
import StateMod

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

tree :: Tree Char
tree = Node (Node (Leaf 'a') (Leaf 'b')) (Leaf 'c')

-- reLabel :: Tree a -> Int -> (Tree Int, Int)
-- reLabel (Leaf _) n = (Leaf n, n+1)
-- reLabel (Node l r) n = (Node l' r', n'')
--     where
--     (l', n') =  reLabel l n
--     (r', n'') = reLabel r n'

fresh :: ST Int 
fresh = S (\n -> (n,n+1))

appLabel :: Tree a -> ST (Tree Int)
appLabel (Leaf _) = Leaf <$> fresh
appLabel (Node l r) = Node <$> appLabel l <*> appLabel r





-- main = 
