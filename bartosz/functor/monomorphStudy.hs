aa :: [Maybe String] -> [Maybe String] 
aa = (<$>) (fmap (++ " !")) 

bb :: [Maybe String] -> [Maybe String] 
bb l = (<$>) (fmap (++ " !")) l

-- cc :: [Maybe String] -> [Maybe String] -- fails w/o signature 
   cc = (<$>) (fmap (++ " !"))

-- haskell assumes you intended a memoized value binding, 
-- and memoization only makes sense with a concreet type, 
-- so it monomorphizes. It needs a parameter on lhs :

-- dd :: [Maybe String] -> [Maybe String]
   dd x = (<$>) (fmap (++ " !"))
