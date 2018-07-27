{--

Cale study : https://imgur.com/a/CbkR5
also  https://en.wikibooks.org/wiki/Haskell/Lists_III#foldr

simple recursive pattern on lists :

f [] = value
f (x:xs) = x # f xs  -- # is the operator applied
                     -- to the head of the list.
                     -- Followed by a recursive
                     -- process on tail.

 
> foldr (⊕) z [a,b,c]
a ⊕ (b ⊕ (c ⊕ z))



foldr encapsulates this simple recursive pattern 
with # and value as arguments :

--}

summ :: Num a => [a] -> a
summ = foldr (+) 0               -- unit: n + 0 = n

prod :: Num a => [a] -> a
prod = foldr (*) 1               -- unit: n * 1 = n

orr :: [Bool] -> Bool
orr = foldr (||) False           -- unit: False || x = x

andd :: [Bool] -> Bool
andd = foldr (&&) True           -- unit:  True && b = b


-- Every monoid comes with two things: an associative operator, 
-- and an identity specific to that operator.
-- The unit (identity) is the element that when applied to 
-- another one does nothing.

{-- 

xs == [] ++ xs 
  
or xs == or ([] ++ xs) ==

or [] || or xs == 

False || or xs == or xs 

--}


-- foldr defined recursively :

foldrr :: (a -> b -> b) -> b -> [a] -> b
foldrr f v [] = v
foldrr f v (x:xs) = f x (foldr f v xs)

-- behavior is non-recursive: it replaces cons operator
-- with function f, and empty list at end with v.

