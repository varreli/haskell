data Tree a = Leaf a | Node (Tree a) a (Tree a)


occursTSearch :: (Ord a) => a -> Tree a -> Bool

occursTSearch x (Leaf y)               =  x == y
occursTSearch x (Node l y r) | x == y  =  True
                             | x < y   =  occursTSearch x l
                             | x > y   =  occursTSearch x r

t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))
tt = Leaf (33)

