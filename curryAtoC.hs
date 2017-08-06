co :: (b -> c) -> (a -> b) -> a -> c
co f g = f . g

-- or :
-- co = (.)




-- Prelude> :t (\x -> x + 1) . (\x -> x - 2)
-- Num c => c -> c

-- f . g = \x -> f (g x)
-- here (.) is just a regular function, but infix
