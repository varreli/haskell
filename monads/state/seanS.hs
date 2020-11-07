module S where
import Prelude hiding (read)
import Control.Applicative
import Control.Monad (liftM, ap) 

instance Functor     (S s) where        -- |
    fmap = liftM                        -- |  minimal instance
                                        -- |  declarations
instance Applicative (S s)  where       -- |
    pure  = return
    (<*>) = ap

data S s a = S { runS :: s -> (a,s) }
-- runS :: S s a -> s -> (a,s)      -- runS unwraps the 'S' 
                                    -- data Constructor 

instance Monad (S s) where  -- partial application to (S s)
                            -- monad must have kind * -> *

  -- return :: a -> S s a
  return a = S $ \s -> (a,s)  -- wrapped function
  -- (>>=) :: S s a -> (a -> S s b) -> S s b
  S f >>= k =
    -- f :: s -> (a,s)
    -- k :: a -> S s b
    S $ \s -> let (a, s') = f s
                in runS (k a) s'
    
    -- k a           :: S s b      apply k to a to get S s b
    -- runS (k a)    :: s -> (b,s)
    -- runS (k a) s' :: (b,s)

read :: S s s
read = S $ \s -> (s,s)

write :: s -> S s ()
write s = S $ \_ -> ((),s)   -- \_ shows old state is discarded

ff :: S Int Int
ff = do x <- read
        write (x+1)
        x <- read
        return (x*10)

test :: (Int, Int)
test = runS ff 0   -- has type (Int,Int) since: runS :: s -> (a,s)

