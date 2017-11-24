-- Cale study : https://imgur.com/a/CbkR5
-- also  https://en.wikibooks.org/wiki/Haskell/Lists_III#foldr

-- simple recursive pattern on lists :

-- f [] = value
-- f (x:xs) = x # f xs  -- # is the operator applied
                     -- to the head of the list.
                     -- Followed by a recursive
                     -- process on tail.


-- foldr encapsulates this simple recursive pattern 
-- with # and value as arguments :

summ :: Num a => [a] -> a
summ = foldr (+) 0

orr :: [Bool] -> Bool
orr = foldr (||) False

andd :: [Bool] -> Bool
andd = foldr (&&) True


-- foldr defined recursively :

foldrr :: (a -> b -> b) -> b -> [a] -> b
foldrr f v [] = v
foldrr f v (x:xs) = f x (foldr f v xs)

-- behavior is non-recursive: it replaces cons operator
-- with function f, and empty list at end with v.
