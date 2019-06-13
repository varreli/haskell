split :: Ord a => a -> [a] -> ([a],[a])
split x [] = ([], [])

split x (y:ys)
  | y < x       = (y:less, greater)
  | otherwise   = (less, y:greater)
                where (less, greater) = split x ys

                -- the where clause is a pattern
		-- match on the 2 tuple and the
		-- recursion, split x ys. Finally
		-- we will see split x [] . after
		-- the last combination, split
		-- will either return bottom or 
		-- a 2 tuple .
