-- simple recursive pattern on lists :


f [] = value
f (x:xs) = x # f xs  -- # is the operator applied
                     -- to the head of the list.
		     -- Followed by a recursive
		     -- process on tail.


-- foldr encapsulates this pattern with # and
-- value as arguments :

sum :: Num a => [a] -> a
sum = foldr (+) 0

or :: [Bool] -> Bool
or = foldr (||) False
