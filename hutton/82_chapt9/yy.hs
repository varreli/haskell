interleave :: a -> [a] -> [[a]]
interleave x []     = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)
 
perms :: [a] -> [[a]]
perms []     = [[]]
perms (x:xs) = concat (map (interleave x) (perms xs))

-- pavonia> No, it's 

-- perms (x:xs) = concat (map (interleave x) (perms xs)) 

-- with x = 5, xs = [6,7]. No empty list there
