-- with foldr :

-- [a, b, c] becomes f a (f b (f c z))


-- with foldl : 

-- [a, b, c] becomes f (f (f z a) b) c


--  note that in both cases, the 'a' value is 
--  visited first.
