ff :: [a] -> (a -> Bool) -> (a -> b) -> [b]
ff xs p f = map f (filter p xs)

------------------------------------------------
alll :: (a -> Bool) -> [a] -> Bool
alll p [] = True
alll p (x:xs) = p x && alll p xs

-- x is a parameter name…  you use it in the 
-- definition to refer to the parameter. Its 
-- name is not visible outside of the definition


λ > alll (\x -> mod x 3 == 0) [3,6,9,12,15]

-- x must be introduced first as in \x.

-------------------------------------------------
