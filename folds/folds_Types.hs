foldrr :: (a -> b -> b) -> b -> [a] -> b

-- b is the type of the seed; and a is the
-- element type. this function says how to
-- combine an element into the seed :

foldrr f z []     = z
foldrr f z (x:xs) = f x (foldrr f z xs)

length1 :: [a] -> Int
length1 = foldrr (\_ seed -> seed + 1) 0        -- newElement, seed


-- foldl :: (a -> b -> b) -> a -> [b] -> a

length2 :: [a] -> Int
length2 = foldl (\seed -> \_ -> seed + 1) 0     -- seed, newElement

mullti :: [a] -> Int
mullti = foldl (\seed -> \_ -> seed * 2) 1     -- seed, newElement


-- folds are called catamorphisms.
