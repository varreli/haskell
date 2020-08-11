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
newtype State s a = S { runState :: s -> (a,s) } 

get :: State s s
get = S (\s -> (s, s))

put :: s -> State s ()
put val = S (\s -> ((), val) )


instance Monad (State s) where

-- (>>=) :: State s a -> (a -> State s b) -> State s b
  x >>= f = S (\s -> let (v, s') = runState x s 
                         in runState (f v) s')


  return g = S (\s -> (g, s)) 


tick = get >>= \n -> put (n+1)   
                                     
pure' = get >>= \n -> return (n+5) 

-- ghci> runState pure' 3 == runState (fmap (+5) get) 3
-- True

-- evaluation of tick:

-- tick = S (\s -> let (v, s') = runState get s in runState (put (v+1)) s')

-- tick = S (\s -> runState (put (s+1)) s)

-- tick = S (\s -> runState (S (\s -> (s+1, ())) s)

-- tick = S (\s -> (s+1, ()))


