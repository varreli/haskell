pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)

sorted :: Ord a => [a] -> Bool
sorted xs = and [ x <= y | (x, y) <- pairs xs]


--  λ > pairs [2,3,4,5,6]
--  [(2,3),(3,4),(4,5),(5,6)]


-- on line 5 'and' returns the conjunction of the 
-- boolean list:

-- and [True,True,True]
-- True

--  λ > sorted [2,3,4,5,6]
--  True 

-- sorted also works under lazy evaluation.

positions :: Eq a => a -> [a] -> [Int]
positions x ls = [i | (elem, i) <- zip ls [0..], elem == x]

-- note infinite list against length of ls. Lazy
-- evaluation - no need to declare it explicitly
