
mult x y = (\(x,y) -> [x,y] <*> [4,5] <*> [10,20]) 
  where
    x = (*)
    y = (+)
