-- here, Node' a [Tree' a] could have [0..]
-- Tree instances. If [], Node' a is the 
-- only value. this is wrong, see below error:

data Tree' a = Leaf' a | Node' a [Tree' a]

occurs' :: Ord a => a -> Tree' a -> Bool
occurs' x (Leaf' y)                 = x == y
occurs' x (Node' l y r) | x == y    = True
                       | x < y     = occurs' x l
                       | otherwise = occurs' x r


data Tree a = Leaf a | Node (Tree a) a (Tree a)

occurss :: Ord a => a -> Tree a -> Bool
occurss x (Leaf y)                 = x == y
occurss x (Node l y r) | x == y    = True
                       | x < y     = occurss x l
                       | otherwise = occurss x r


-- Line 5:12: error:
-- The constructor 'Node' should have 2 arguments, 
-- but has been given 3.
