instance Applicative Maybe where
        pure = Just a
        Nothing <*> _ = Nothing
        (Just f) <*> mx = fmap f mx

-- if 

f :: a -> b: 

-- then 

Just f :: Maybe (a -> b) 

-- and if we pattern match on something of type Maybe (a -> b) 
-- with the pattern (Just f) then we get back 

f :: a -> b
