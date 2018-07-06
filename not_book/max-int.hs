mxmInt :: [Int] -> Int
mxmInt [] = error "Empty list"
mxmInt [x] = x
mxmInt (x:xs) = max x (mxmInt xs)
main = print $ mxmInt [4,22,3,56,77,1]


-- max does a foldl manually; it builds a chain of invocations
-- of max :

-- max a (max b (max c (max d e)))      


-- see   Debug.SimpleReflect
