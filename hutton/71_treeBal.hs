data Tree2 a = Leaf2 a | Node2 (Tree2 a) (Tree2 a) deriving (Eq, Show)

counter :: Tree2 a -> Int
counter (Leaf2 _) = 1 
counter (Node2 l r) = counter l + counter r

balanced :: Tree2 a -> Bool
balanced (Leaf2 a) = True
balanced (Node2 l r) = (abs (counter l - counter r) <= 1)
                       
                     && balanced l    -- checks
                     && balanced r    -- deeper in nodes


balance :: [a] -> Tree2 a
balance [] = error "Cannot create empty Tree"
balance [x] = Leaf2 x
balance xs = Node2 (balance (take mid xs)) (balance (drop mid xs))
               where ll  = length xs
                     mid = ll `div` 2


tt = (Node2 (Node2 (Leaf2 3) (Leaf2 5)) (Node2 (Leaf2 7) (Leaf2 8)))

qq = (Node2 (Node2 (Leaf2 3) (Leaf2 5)) (Node2 (Node2 (Leaf2 7) (Leaf2 8)) (Node2 (Leaf2 9) (Leaf2 10))))
