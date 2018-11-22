-- instance Functor ((->) r) where
--    fmap = (.)

-- fmap :: (b -> c) -> (a -> b) -> (a -> c) 
-- fmap :: (a -> b) -> (r -> a) -> (r -> b)

composerr :: (a -> b) -> (r -> a) -> (r -> b)
composerr f g x = f (g x) 

composerr' :: (a -> b) -> (r -> a) -> (r -> b)
composerr' = (.) 
