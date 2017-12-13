-- redefine functions:


take_while :: (a -> Bool) -> [a] -> [a]

take_while p [] = []
take_while p (x:xs)
  
  | p x = x : take_while p xs
  | otherwise = []


drop_while :: (a -> Bool) -> [a] -> [a]

drop_while p [] = []
drop_while p (x:xs)

  | p x = drop_while p xs
  | otherwise = x : xs


-- λ > drop_while (\x -> mod x 3 == 1) [10,13,16,16,22,31]
-- []

mapp :: (a -> b) -> [a] -> [b]
mapp f = foldr (\x y -> f x : y) []      -- acc named y

mapper :: (a -> b) -> [a] -> [b]
mapper f = foldr (\x xs -> f x : xs) []  -- acc named xs.


-- note on accumulators : 'Updating' an acc sounds imperative,
-- but is ok as a mental model if we know we're updating where 
-- variables point and not mutating what they point to.

-- Imagine variables as labels pointing to the various actual 
-- values in memory. Mutating would be like keeping acc pointing 
-- to the same memory, but modifying the value there. We don't 
-- do that; we merely point acc to another location.
