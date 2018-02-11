data Tree a = Leaf a | Node (Tree a) a (Tree a)

occursT :: (Ord a) => a -> Tree a -> Bool
occursT x (Leaf y)     =  compare x y == EQ
occursT x (Node l y r) =
  case compare x y of
    EQ -> True
    LT -> occursT x l
    GT -> occursT x r
