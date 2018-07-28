g :: (a -> b) -> (a, c) -> (b, c)
g f (x, y) = (f x, y)

