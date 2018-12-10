isoMorph :: Num a => a -> a -> Char -> String -> (a , String)
isoMorph x y c str = (isomorphNum , myString)
  where
    isomorphNum  = (x + y)
    myString = (c : str) -- ++ " " ++ show x ++ " " ++ show y 

result = isoMorph 3 4.4 'a' "bcd"

result2 = fst result 

