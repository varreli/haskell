mxmInt :: [Int] -> Int
mxmInt [] = error "Empty list"
mxmInt [x] = x
mxmInt (x:xs) = max x (mxmInt xs)
main = print $ mxmInt [4,22,3,56,77,1]
