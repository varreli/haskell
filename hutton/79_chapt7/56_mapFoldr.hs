mmap, mapp, mapper, mappe :: (a -> b) -> [a] -> [b]

mmap _ [] = []
mmap f (x:xs) = f x : mmap f xs

mapp f = foldr (\x y -> f x : y) []      -- acc named y

mapper f = foldr (\x xs -> f x : xs) []  -- acc named xs.

mappe ff = foldr ((:) . ff) []  -- result of ff is fed to (:)
                                


-- note on accumulators : 'Updating' an acc sounds imperative,
-- but is ok as a mental model if we know we're updating where 
-- variables point and not mutating what they point to.

-- Imagine variables as labels pointing to the various actual 
-- values in memory. Mutating would be like keeping acc pointing 
-- to the same memory, but modifying the value there. We don't 
-- do that; we merely point acc to another location.

