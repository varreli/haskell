lengtth :: [a] -> Int 
lengtth = foldrr (\_ n -> n + 1) 0

-- foldr iterates over a foldable structure one 
-- element at a time:   \_   is the 1st element
-- and n is the accumulator.


-- It takes an accumulator function where the first 
-- parameter is an element from your Foldable 
-- structure (like a List), and the second parameter 
-- is your accumulator value.

-- We call f with two arguments: x (of type 'a') and 
-- either v for the empty list case or (foldr f v xs) 
-- for the non-empty case (both of which are of type 'b') :

foldrr :: (a -> b -> b) -> b -> [a] -> b
foldrr f v [] = v
foldrr f v (x:xs) = f x (foldr f v xs)
