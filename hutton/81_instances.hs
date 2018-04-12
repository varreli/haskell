-- From the prelude -- complete the instance declarations :


instance Eq a => Eq (Maybe a) where
  (==) Nothing Nothing   = True
  (==) (Just x) (Just y) = x == y
  (==) _ _               = False

instance Eq a => Eq [a] where
  (==) [] []         = True
  (==) (x:xs) (y:ys) = x == y && xs == ys
  (==) _ _           = False

