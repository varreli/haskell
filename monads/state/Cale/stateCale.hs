import Control.Applicative      
import Control.Monad (liftM, ap) 


instance Functor     (State s) where    -- |
    fmap = liftM                        -- |  minimal instance
                                        -- |  declarations
instance Applicative (State s) where    -- |
    pure  = return
    (<*>) = ap

--------------------------------------------------------------
newtype State s a = S { runState :: s -> (s, a) } 

-- runState :: State s a -> s -> (s,a)
-- runState (S f) s = f s

get :: State s s
get = S (\s -> (s, s))

put :: s -> State s ()
put val = S (\s -> (val, ()) )

-- give :: a -> State s a
-- give g = S (\s -> (s,g))



instance Monad (State s) where

-- (>>=) :: State s a -> (a -> State s b) -> State s b

  x >>= f = S (\s -> let (s', v)  = runState x s 
                         (s'', w) = runState (f v) s' 
                         in (s'', w))

  return g = S (\s -> (s,g)) 


purre = get >>= \n -> return (n+1)
increment = get >>= \n -> put (n+1) 
-- ghci> runState increment 5
-- (6, ())