-- @[] is an extension telling pure that our f is [] (a list) :

> :t pure @[] (*)
 Num a => [a -> a -> a]

> :t pure @[] ((*), (+))
(Num a1, Num a2) => [(a1 -> a1 -> a1, a2 -> a2 -> a2)]

-- it's not obvious just from the types here that the 
-- list is just a single item, but that stems from how 
-- pure is defined for [], pure a = [a]