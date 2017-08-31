-- flipper :: (x -> y -> z) -> (y -> (x -> z)) 
-- flipper f a b = f b a

-- flipp :: (x -> y -> z) -> (y -> x -> z)
-- flipp f a b = f b a

-- flips :: (x -> y -> z) -> y -> x -> z
-- flips f a b = f b a

-- flipps :: (x -> y -> z) -> y -> x -> z
-- flipps f = g
--  where g a b = f b a

myFlip :: (x -> y -> z) -> y -> x -> z
myFlip f = \x -> \y -> f y x


