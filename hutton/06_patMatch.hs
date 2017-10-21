(&&>) :: Bool -> Bool -> Bool
(&&>) x y | True && y = y      -- rhs not a pattern match
          | otherwise = False

annd :: Bool -> Bool -> Bool
annd True b = b
annd False _ = False

test :: [Char] -> Bool
test ['a', _ , _] = True
test _ = False

--  the pattern matching happens with the patterns 
--  to the left of the  |  and the arguments that 
--  this function is eventually applied to.
--  Patterns match structure, not values. Guards 
--  let you evaluate, i.e test values. (see line 2) 
