instance Functor [] where
-- fmap :: (a -> b) -> f a -> f b
fmap g [] = []
fmap g (x:xs) = fmap g xs ++ [g x]
