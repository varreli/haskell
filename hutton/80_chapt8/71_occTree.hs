data Tree a = Leaf a | Node (Tree a) a (Tree a)

occursT :: (Ord a) => a -> Tree a -> Bool
occursT x (Leaf y)     =  compare x y == EQ
occursT x (Node l y r) =
  case compare x y of
    EQ -> True
    LT -> occursT x l
    GT -> occursT x r


t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Node (Leaf 9) 22 (Leaf 19)))

-- Prelude> occursT 19 t
-- False

-- ( since last compare 11 (Leaf 19) => False ) 

-- So it must be in ascending order:

tt = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Node (Leaf 9) 11 (Leaf 19)))

-- Prelude> occursT 19 t
-- True                     


