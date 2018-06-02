
split :: [a] -> [([a], [a])]
split []     = []
split [_]    = []                                              -- hangs without thisG
split (x:xs) = ([x], xs) : [(x:ls, rs) | (ls, rs) <- split xs]

-- split [1,2,3] = ([1],[2,3]) : (1:[2], [3]) : [(1:2:3[], [])]
--                 [([1],[2,3]), ([1,2], [3]), ([1,2,3], []) ]
