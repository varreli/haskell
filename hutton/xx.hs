data B-Tree a = B-Leaf a | B-Node (B-Tree a) (B-Tree a)

counter :: B-Tree a -> Int
counter (B-Leaf _) = 1 
