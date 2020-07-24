module StateCaleMod2 where

import Control.Applicative      
import Control.Monad (liftM, ap) 

instance Functor     (State s) where    -- |
    fmap = liftM                        -- |  minimal instance
                                        -- |  declarations
instance Applicative (State s) where    -- |
    pure  = return
    (<*>) = ap
---------------------------------------------------------------
newtype State s a = S { runState :: s -> (s, a) } 

get :: State s s
get = S (\s -> (s, s))

put :: s -> State s ()
put val = S (\s -> (val, ()) )


instance Monad (State s) where

-- (>>=) :: State s a -> (a -> State s b) -> State s b
  x >>= f = S (\s -> let (s', v) = runState x s 
                         in runState (f v) s' )


  return g = S (\s -> (s,g)) 
