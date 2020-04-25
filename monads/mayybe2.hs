import Data.Maybe

-- maybe :: a -> (b -> a) -> Maybe b -> a

tt = maybe 3 negate ( lookup 4 [(1,10), (4,15)] ) 

uu = maybe 5 negate (lookup 9 [(1,10),(2,20)])

vv = fromMaybe "boy" (lookup 3 [(3, "dog"), (4, "cat")])

ww = catMaybes [lookup 0 a, lookup 1 a, lookup 2 a]
    where a = [(1,"belt"), (2,"fawn"), (3, "lawn")]
