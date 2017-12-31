data Tree a = Leaf a | Node (Tree a) a (Tree a)

occurs :: Eq a => a -> Tree a -> Bool
occurs x (Leaf y) = x == y
occurs x (Node l y r) = x == y || occurs x l || occurs x r

flatten :: Tree a -> [a]
flatten (Leaf x)     = [x]
flatten (Node l x r) = flatten l ++ [x] ++ flatten r

t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))
tt = Leaf (33)

-- > flatten t
-- [1,2,3,4,5,6,7,9]

-- > flatten tt
-- [33]

-- Note: Leaf a *is* of the Tree a data type : 
-- Leaf (33) returns a flattened single element
-- list of type a , [33].
