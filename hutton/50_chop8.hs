chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)


take n _      | n <= 0 = []
take _ []              = []
take n (x:xs)          = x : take (n-1) xs

-- example:

-- {-

-- take 2 [1,2,3,4]
-- Use cons presentation:
-- take 2 1:(2:(3:(4:[])))
-- =>  x : take (n-1) xs
--     1 : take (2-1) 2:(3:(4:[]))
--     1 : (2 : take (1-1) 3:(4:[])
--     1 : (2 : [])
--     [1,2]

-- -}
