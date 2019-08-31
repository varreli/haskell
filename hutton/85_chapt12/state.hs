type State = Int
newtype ST a = S (State -> (a, State)) -- newtype requires 
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
                       



-- re: instance Applicative ST :

-- The state being passed from `stf` to `stx` is s'
 
-- giving state to stf results in a tuple of a new state 
-- called s' and a function called f. this is what the 
-- line "let (f,s') = app stf s" is doing.
 
-- that new state s' is then used to give state to stx, 
-- giving another new state called s'' and a value 
-- called x. the last thing we do is apply our function 
-- f to our value x because that's what our type signature 
-- requires, and bundle that with the last state.

instance Monad ST where
-- (>>=) :: ST a -> (a -> ST b) -> ST b
  st >>= f = S (\s -> let (x,s') = app st s
                          in app (f x) s')
