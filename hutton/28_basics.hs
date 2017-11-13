-- determine if all logical values in a list are 
-- True : 

andd :: [Bool] -> Bool

andd [] = True
andd (x:xs) 
  | not x = False
  | otherwise = andd xs

annd :: [Bool] -> Bool
annd xs = all xs


-- all p = and . map p     
-- can be read as    all p xs = and (map p xs)
