initt, init0, init1 :: [a] -> [a]

initt xs = take (length xs - 1) xs 

init0 list = reverse (tail (reverse list))

init1 [_]      = []
init1 (x : xs) = x : init1 xs

