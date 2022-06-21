import System.IO

maybeAdd :: Num b => Maybe b -> Maybe b -> Maybe b 
maybeAdd mx my = mx >>= (\x -> my >>= (\y -> Just $ x+y))

--These 2 further generalize from Maybe to Monad, so we 
-- can use any Monad now:

maybeAdded :: (Monad m , Num b) => m b -> m b -> m b
maybeAdded mx my = mx >>= (\x -> my >>= (\y -> return $ x+y))
-- This is messy, so we'll use do notation:

monadd :: (Monad m , Num b) => m b -> m b -> m b
monadd mx my = do
  x <- mx
  y <- my
  return $ x+y


 

