module StateHutton where

type State = Int
newtype ST a = S (State -> (a, State))    -- newtype requires 
                                          -- dummy constructor S


app :: ST a -> State -> (a, State)
app (S st) x = st x


instance Functor ST where
--  fmap :: (a -> b) -> ST a -> ST b
  fmap g st = S (\s -> let (x,s') = app st s
                           in (g x, s'))

instance Applicative ST where
 -- pure :: a -> ST a
    pure x = S (\s -> (x,s))
 -- (<*>) :: ST (a -> b) -> ST a -> ST b
    stf <*> stx = S (\s -> let (f,s') = app stf s 
                               (x,s'') = app stx s'
                               in (f x, s''))
---------------------------------------------------------------
{-- In this manner the bind operator for the state monad 
integrates the sequencing of state transformers with the 
processing of their result values. Note that within the 
definition for >>= we produce a new state transformer f x , 
whose behaviour may depend on the result value of the first 
argument x, whereas with <*> we are restricted to using state 
transformers that are explicitly supplied as arguments. As 
such, using the >>= operator provides extra flexibility. --} 

instance Monad ST where
-- (>>=) :: ST a -> (a -> ST b) -> ST b
  st >>= f = S (\s -> let (x,s') = app st s
                          in app (f x) s')

