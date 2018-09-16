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


-- https://wiki.haskell.org/wikiupload/5/5a/Left-fold-transformation.png 

-- https://wiki.haskell.org/wikiupload/3/3e/Right-fold-transformation.png
