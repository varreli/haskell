-- instance Functor ((->) r) where       -- (->) is partially applied
--    fmap = (.)

-- fmap :: (b -> c) -> (a -> b) -> (a -> c) 
-- fmap :: (a -> b) -> (r -> a) -> (r -> b)

composer :: (a -> b) -> (r -> a) -> (r -> b)
composer f g = f . g 

composerr :: (a -> b) -> (r -> a) -> (r -> b)
composerr = (.)

composerr' :: (a -> b) -> (r -> a) -> (r -> b)
composerr' = fmap 
