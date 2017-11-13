eta reduction is:


f x = g y x   =>

f = g y


-- so if we have:

f x = g x y   =>

f = flip g x y

-- > :t (!!)
-- [a] -> Int -> a

-- > :t flip (!!)
-- Int -> [a] -> a
