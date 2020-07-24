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

-- runState :: State s a -> s -> (s,a)
-- runState (S f) s = f s

get :: State s s
get = S (\s -> (s, s))

put :: s -> State s ()
put val = S (\s -> (val, ()) )


instance Monad (State s) where

-- (>>=) :: State s a -> (a -> State s b) -> State s b
  x >>= f = S (\s -> let (s', v) = runState x s 
                         in runState (f v) s' )


  return g = S (\s -> (s,g)) 


increment = get >>= \n -> put (n+1)   -- ghci> runState increment 5
                                      -- (6, ())

pure'  = get >>= \n -> return (n+5)   -- ghci> runState pure' 2
                                      -- (2,3) 

-- ghci> runState pure' 3 == runState (fmap (+5) get) 3   >> True
