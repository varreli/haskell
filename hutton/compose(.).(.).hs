-- think of (.) . (.) as being a special case 
-- of fmap . fmap :

-- fmap :: (a -> b) -> (f a -> f b), 
-- so fmap . fmap :: (a -> b) -> (g (f a) -> g (f b)) 
-- (for some functors f and g)


https://gist.github.com/dminuoso/3d0b15ef96b149d35ddee3d8d2935ea7
