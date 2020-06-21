import StateMod

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show


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


tree  :: Tree Char
tree = Node (Node (Leaf 'a') (Leaf 'b')) (Leaf 'c')

tree2 :: Tree Char 
tree2 = Node (Node (Leaf 'a') (Leaf 'b')) (Leaf 'c')

-- examples:

rlabel = reLabel tree 4
labelA = app (aLabel tree2) 4    -- Show error without app.

