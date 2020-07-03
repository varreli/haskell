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

mlabel :: Tree a -> ST (Tree Int)
mlabel (Leaf _)    = do n <- fresh
                        return (Leaf n)
 
mlabel (Node l r)  = do l' <- mlabel l
                        r' <- mlabel r
                        return (Node l' r')

tree  :: Tree Char
tree = Node (Node (Leaf 'a') (Leaf 'b')) (Leaf 'c')

-- examples:

reelabel = reLabel tree 4
labelApp = app (aLabel tree) 4    -- Show error without app.
monadLab = app (mlabel tree) 4
