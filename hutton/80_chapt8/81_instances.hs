-- From prelude; complete the instance declarations :


instance Eq a => Eq (Maybe a) where
  (==) Nothing Nothing   = True
  (==) (Just x) (Just y) = x == y
  (==) _ _               = False

-- this will return False:
-- > (==) Nothing (Just 4)

instance Eq a => Eq [a] where
  (==) [] []         = True
  (==) (x:xs) (y:ys) = x == y && xs == ys
  otherwise False -- (==) _ _           = False


-- the second one is recursive so (==) [] [] 
-- is a base case. 

-- (==) _ _ = False is "match any other case."  
-- Note also use: ' otherwise False '
