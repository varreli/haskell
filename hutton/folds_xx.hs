-- foldr uses operator that is assumed to 
-- associate to the right:

> foldr (+) 0 [1,2,3]

-- results in :
-- 1 + (2 + (3 + 0))
6

> scanr (/) 20 [2,3,4]
[0.13333333333333333,15.0,0.2,20.0]

λ > foldr (:) ["cat","dog"] ["goat", "sheep"]
["goat","sheep","cat","dog"]


λ > scanr (:) ["cat","dog"] ["goat", "sheep"]
[["goat","sheep","cat","dog"],["sheep","cat","dog"],["cat","dog"]]


-- foldl uses operator that is assumed to
-- associates to the left :

> foldl (*) 2 [5,6,7]
420

-- results in :
-- (((2 * 5) * 6) * 7) []

> scanl (*) 2 [5,6,7]
[2,10,60,420]

λ > foldl (/) 12 [2,4]
1.5

λ > scanl (/) 12 [2,4]
[12.0,6.0,1.5]

λ > foldl (-) 22 [4,5]
13

λ > scanl (-) 22 [4,5]
[22,18,13]
