import StateMod

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

tree :: Tree Char
tree = Node (Node (Leaf 'a') (Leaf 'b')) (Leaf 'c')

reLabel :: Tree a -> Int -> (Tree Int, Int)
reLabel (Leaf _) n = (Leaf n, n+1)
reLabel (Node l r) n = (Node l' r', n'')
    where
    (l', n') =  reLabel l n
    (r', n'') = reLabel r n'

fresh :: ST Int 
fresh = S (\n -> (n,n+1))

aLabel :: Tree a -> ST (Tree Int)
aLabel (Leaf _) = Leaf <$> fresh
aLabel (Node l r) = Node <$> aLabel l <*> aLabel r

tree2 :: Tree Int 
tree2 = Node (Node (Leaf 1) (Leaf 2)) (Leaf 3)

-- examples:

rlabel = reLabel tree
labelA = app (aLabel tree2) 4    -- Show error without app.

