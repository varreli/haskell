foldBool :: a -> a -> Bool -> a
foldBool x y z =
  case z of
  True -> x
  False -> y


foldBool' :: a -> a -> Bool -> a
foldBool' x y z 
  | z = x
  | otherwise = y


foldBooll :: a -> a -> Bool -> a
foldBooll x y True = x
foldBooll x y False = y
