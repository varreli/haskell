-- defined for lists only:

foldr :: (a -> b -> b) -> b -> [a] -> b


-- b is the type of your accumulator, and a 
-- is the element type. that function says how 
-- to combine an element into your accumulator

foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
