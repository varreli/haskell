foldBool :: a -> a -> Bool -> a
foldBool x y z =
  case z of
  False -> x
  True  -> y


foldBool' :: a -> a -> Bool -> a
foldBool' x y z 
  | z = y 
  | otherwise = x


foldBooll :: a -> a -> Bool -> a
foldBooll x _ False = x
foldBooll _ y True  = y
