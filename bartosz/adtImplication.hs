data Tri = Zelda | Trent | Ganon
data Bool = False | True

-- When we are counting inhabitants of a -> b  ==  b ^ a
-- 
-- Tri -> Bool  ==  Bool ^ Tri (2 ^ 3 = 8)
-- Bool -> Tri  ==  Tri ^ Bool (3 ^ 2 = 9)
-- 
-- A function X -> Bool is equivalent to a subset 
-- of X: if the value on an argument is true, it 
-- belongs to our subset, and if it's false, it doesn't.
-- 
-- Any subset of X yields a function X -> Bool this way, 
-- and any function X -> Bool yields a subset

-- Tri -> Bool :

1  Zelda -> False , Trent -> False , Ganon -> False
2  Zelda -> False , Trent -> False , Ganon -> True
3  Zelda -> False , Trent -> True  , Ganon -> False
4  Zelda -> False , Trent -> True  , Ganon -> True
5  Zelda -> True  , Trent -> False , Ganon -> False
6  Zelda -> True  , Trent -> False , Ganon -> True
7  Zelda -> True  , Trent -> True  , Ganon -> False
8  Zelda -> True  , Trent -> True  , Ganon -> True

-- Bool -> Tri

1  False -> Zelda , True -> Zelda
2  False -> Trent , True -> Zelda
3  False -> Ganon , True -> Zelda 
4  False -> Zelda , True -> Trent
5  False -> Trent , True -> Trent
6  False -> Ganon , True -> Trent 
7  False -> Zelda , True -> Ganon
8  False -> Trent , True -> Ganon
9  False -> Ganon , True -> Ganon
