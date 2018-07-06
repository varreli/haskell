mxmInt :: [Int] -> Int
mxmInt [] = error "Empty list"
mxmInt [x] = x
mxmInt (x:xs) = max x (mxmInt xs)
main = print $ mxmInt [4,22,3,56,77,1]


-- max does a foldl manually; it builds a chain of invocations
-- of max :

-- max a (max b (max c (max d e)))      


-- λ > foldl1 max [1,20,4,33,22]
-- 33

-- λ > scanl1 max [1,20,4,33,22]
-- [1,20,20,33,33]  

-- see   Debug.SimpleReflect

