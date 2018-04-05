-- > foldr (:) [5,6,7] [1,2,3,4]
-- [1,2,3,4,5,6,7]  
-- ( evaluates to 1 : 2 : 3 : 4 : [5,6,7] )

lengtth :: [a] -> Int 
lengtth = foldrr (\_ n -> n + 1) 0

-- foldr iterates over a foldable structure one 
-- element at a time:   \_   is the 1st element
-- and n is the accumulator.

-- It takes an accumulator function where the first 
-- parameter is an element from your Foldable 
-- structure (like a List), and the second parameter 
-- is your accumulator value.

(*) -- has both right and left identity: (1*) (*1)
(+) -- has both right and left identity: (y+) (+y)

-- We call f with two arguments: x (of type 'a') and 
-- either v for the empty list case or (foldr f v xs) 
-- for the non-empty case (both of which are of type 'b') :

foldrr :: (a -> b -> b) -> b -> [a] -> b
foldrr f v [] = v
foldrr f v (x:xs) = f x (foldr f v xs)

-- note: we don't need \x since x is not used:

lengthh = foldrr (\_ n -> n + 1) 0

-- but we need it here:

mathy = foldrr (\x y -> x + y / 2) 54 




-- note signature difference, ' t a '   : 

-- foldrr :: (a -> b -> b) -> b -> [a] -> b
-- foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b

-- too general; it won't compile; there's no type for 
-- list [a] : 

matthy = foldr (\x y -> x + y / 2) 54 
