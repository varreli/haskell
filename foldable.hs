-- Prelude > foldl (\x y -> 2*x + y) 4 [1,2,3]
-- 43


-- Prelude > foldr (\x y -> x + y / 2) 54 [12, 4, 10, 6]
-- 12.0



-- > foldl (flip (:)) [5,6,7] [1,2,3,4]
-- [4,3,2,1,5,6,7]


-- > foldr (:) [5,6,7] [1,2,3,4]
-- [1,2,3,4,5,6,7]

-- that evaluates like this       1 : 2 : 3 : 4 : [5,6,7]


-- examples:

-- λ > foldr (/) 64 [4,2,4] 

-- λ > foldl (/) 64 [4,2,4] 

-- λ > foldr (-) 54 [10,11] 




