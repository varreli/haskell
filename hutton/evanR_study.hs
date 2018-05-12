main = do
  print $ [(x,y) | y <- [1..4] , x <- [4,3..1], x == y]
  print $ filter (\(x,y) -> x == y) [(1,2) , (3,4) , (2,2)]
  print $ ["yes" | 1 + 1 == 2]
       


