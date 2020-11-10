import Control.Monad

type State = Int
newtype ST a = S (State -> (a, State)) 
                                       -- newtype requires 
                                       -- dummy constructor S

unwrap :: ST a -> State -> (a, State)
unwrap (S st) x = st x

instance Functor ST where
--  fmap :: (a -> b) -> ST a -> ST b
  fmap g st = S (\s -> let (x,s') = unwrap st s
                           in (g x, s'))

                       
tick :: ST Int 
tick = S (\n -> (n,n+1))
-- ghci> unwrap tick 5
-- (5,6)
 
ticker n = unwrap (replicateM n tick) 
-- ghci> ticker 3 5
-- ([5,6,7],8)

evenTick = map (unwrap (fmap even tick))       -- (fmap even tick)
                                               -- is state
------------------------------------------------------------------

instance Applicative ST where
 -- pure :: a -> ST a
    pure x = S (\s -> (x,s))
 -- (<*>) :: ST (a -> b) -> ST a -> ST b
    stf <*> stx = S (\s -> let (f,s')  = (unwrap stf) s 
                               (x,s'') = (unwrap stx) s' 
                               in (f x, s''))


boolTick = Just evenTick <*> Just [0..3]
-- Just [(True,1),(False,2),(True,3),(False,4)]

-- with Applicatives, an action can't depend on a 
-- value from a previous action; in monad it can.


-- re: instance Applicative ST :

-- The state being passed from `stf` to `stx` is s'
 
-- giving state to stf results in a tuple of a new state 
-- called s' and a function called f. this is what the 
-- line        let (f,s') = unwrap stf s        is doing.
 
-- that new state s' is then used to give state to stx, 
-- giving another new state called s'' and a value 
-- called x. the last thing we do is apply our function 
-- f to our value x because that's what our type signature 
-- requires, and bundle that with the last state.
