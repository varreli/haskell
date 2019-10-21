-- Logic of (Either a b) being a functor:

-- instance Functor (Either a) where
--    fmap f (Right x) = Right (f x)
--    fmap f (Left x) = Left x

-- fmap :: (c -> d) -> f c -> f d

-- Since (Either a) is the functor, we substitute it for f

-- fmap :: (c -> d) -> Either a c -> Either a d

----------------------------------------------------------------------

-- The type of Right (f x) is
-- Either a (f x)

-- so (f x) is d :  Either a d     (the return type)

-- The type of Left (f x) is

-- Either (f x) b : Either d b     (not the return type, d must be in
--                                 second parameter:  -> Either a d )               
-- So we cannot fmap over Left 

tt = fmap (*100) (Left 5)
uu = fmap (*200) (Right 3)
