ff :: [a] -> (a -> Bool) -> (a -> b) -> [b]
ff xs p f = map f (filter p xs)

