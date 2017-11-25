-- foldr uses operator that is assumed to 
-- associate to the right:

> foldr (+) 0 [1,2,3]

-- results in :
-- 1 + (2 + (3 + 0))
6

-- foldl associates to the left :

> foldl (*) 1 [4,5,6,]

-- results in :
-- (((1 * 4) * 5) * 6) []
120
