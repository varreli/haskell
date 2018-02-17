-- This fails since the pattern match is wrong. 

-- Node a [Tree] gives a 'rose Tree structure, with
-- one node and [0..] Trees instances. Also if we 
-- have [], Node' a is the only value, and Leaf is 
-- not needed, since [] will return Node' a as the 
-- only value (like behavior of single Leaf) :

data Tree' a = Leaf' a | Node' a [Tree' a]

occurs' :: Ord a => a -> Tree' a -> Bool
occurs' x (Leaf' y)                 = x == y
occurs' x (Node' l y r) | x == y    = True
                       | x < y     = occurs' x l
                       | otherwise = occurs' x r



-- Line 5:12: error:
-- The constructor 'Node' should have 2 arguments, 
-- but has been given 3.

-- See 69_tree.hs. The correct data constructor is:

data Tree a = Leaf a | Node (Tree a) a (Tree a)
