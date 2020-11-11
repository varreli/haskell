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
newtype State s a = S { runSt :: s -> (a,s) } 

get :: State s s
get = S (\s -> (s, s))

put :: s -> State s ()
put val = S (\s -> ((), val) )


instance Monad (State s) where

  return g = S (\s -> (g, s)) 
-- (>>=) :: State s a -> (a -> State s b) -> State s b
  x >>= f = S (\s -> let (v, s') = runSt x s 
                         in runSt (f v) s')



tick = get >>= \n -> put (n+1)   
                                     
pure' = get >>= \n -> return (n+5) 

-- ghci> runSt pure' 3 == runSt (fmap (+5) get) 3
-- True

-- evaluation of tick:

-- tick = S (\s -> let (v, s') = runSt get s in runSt s' (put (v+1)))

-- tick = S (\s -> runSt s (put (s+1)) )

-- tick = S (\s -> runSt (S (\s -> ((), s+1) ) s)

-- tick = S (\s -> ((), s+1))

---------------------------------------------------------------

-- the functor definition only applies to the 'a' type of 
-- 'State s a'

-- so no functor methods can directly access the 's' type.

-- the pure' equivalence emerges because 'return' is equivalent 
-- to 'pure' and 'fmap' is really:

--                         ap . pure  
