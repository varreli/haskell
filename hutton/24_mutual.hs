-- mutual recursion, passed between 2 functions:

evenn :: Int -> Bool
evenn 0 = True
evenn n = oddd (n - 1)

oddd :: Int -> Bool
oddd 0 = False
oddd n = evenn (n - 1)


-- mutual recursion, returns elements at even or 
-- odd postions of a list:

evens :: [a] -> [a]
evens [] = []
evens (x:xs) = x : odds xs

odds :: [a] -> [a]
odds [] = []
odds (_:xs) = evens xs  -- the head is dropped here


-- evens 1 : odds [2,3,44]
-- 
-- 1 : odds [3,44]
-- 
-- 1 : 3 : odds [44]
-- 
-- 1 : 3 : odds [] 
-- 
-- odds [] = 1:3:[]
-- 
-- [1,3] 
