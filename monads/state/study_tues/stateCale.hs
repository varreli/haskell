import Control.Monad

instance Applicative (State s) where
    pure x = S (\s -> (x,s))
    f <*> x = S (\s -> let (s',v) = runState f s
                           (s'',w) = runState (f v) s'
                           in (s'',w))
instance Monad (State s) where

-- newtype State s a = S (s -> (s,a))

newtype State s a = S { runState :: s -> (s, a) }

-- runState :: State s a -> s -> (s,a)
-- runState (S f) s = f s

get :: State s s
get = S (\s -> (s, s))

-- tt = get >>= \n -> put (n+1) 

put :: s -> State s ()
put val = S (\s -> (val, ()))

give :: a -> State s a
give g = S (\s -> (s, g))


-- (>>=) :: State s a -> (a -> State s b) -> State s b
x >>= f = S (\s -> let (s', v) = runState x s 
                       (s'', w) = runState (f v) s' 
                       in (s'', w))
