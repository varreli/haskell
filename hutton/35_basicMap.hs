mapp :: (a -> b) -> [a] -> [b]
mapp f xs = [ f x | x <- xs ]

mmap :: (a -> b) -> [a] -> [b]
mmap f (x:xs) = f x : map f xs
