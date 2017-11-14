-- determine if all logical values in a list are 
-- True : 

andd :: [Bool] -> Bool

andd [] = True
andd (x:xs) 
  | not x = False
  | otherwise = andd xs



annd :: [Bool] -> Bool
annd = all (== True)   

aand :: [Bool] -> Bool
aand = and . map (== True) 

andH :: [Bool] -> Bool
andH = and              -- completes the conjunction of list




-- same for tuples:

pairTrue :: (Bool,Bool) -> Bool
pairTrue (x,y) = x && y

pairsAllTrue :: [(Bool,Bool)] -> Bool
pairsAllTrue = all pairTrue

pairsAllTrue2 :: [(Bool,Bool)] -> Bool
pairsAllTrue2 = all (\(x,y) -> x && y)
