-- foldr uses operator that is assumed to 
-- associate to the right:

> foldr (+) 0 [1,2,3]

-- results in :
-- 1 + (2 + (3 + 0))
6

> scanr (/) 20 [2,3,4]

-- basic pattern of foldr is:

f [] = v
f (x:xs) = x # f xs

> lenggth = foldr (\_ n -> n + 1) 0

-- foldl uses operator that is assumed to
-- associates to the left (using scanl) :

> scanl (*) 2 [5,6,7]
[2,10,60,420]

-- results in :
-- (((2 * 5) * 6) * 7) []

-- basic pattern of foldl is:

f v [] = v
f v (x:xs) = f (v # x) xs

> lengtth = foldl (\n _ -> n + 1) 0
