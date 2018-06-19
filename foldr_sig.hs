-- defined for lists only:

-- foldr :: (a -> b -> b) -> b -> [a] -> b


-- b is the type of the seed; and a is the
-- element type. that function says how to
-- combine an element into the seed.

foldrr :: (a -> b -> b) -> b -> [a] -> b
foldrr f z []     = z
foldrr f z (x:xs) = f x (foldrr f z xs)

lengthy :: [a] -> Int
lengthy = foldrr (\_ acc -> acc + 1) 0

-- lenngth :: [a] -> Int
-- lenngth = foldl (\acc -> \_ -> acc + 1) 0

{--

foldr (:) ["take"] ["out"] = (:) ["o"] (foldr (:)    
