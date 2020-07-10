module StateMod where
import Control.Monad


type State = Int
newtype ST a = S (State -> (a, State)) 
                                       -- newtype requires 
                                       -- dummy constructor S

app :: ST a -> State -> (a, State)
app (S st) x = st x

instance Functor ST where
--  fmap :: (a -> b) -> ST a -> ST b
    fmap g st = S (\s -> let (x,s') = app st s
                           in (g x, s'))


instance Applicative ST where
 -- pure :: a -> ST a
    pure x = S (\s -> (x,s))              -- pure won't modify state
 -- (<*>) :: ST (a -> b) -> ST a -> ST b

    (S fx) <*> (S gx) = S $ \s ->                -- this from evTurn
      let (f, s')  = fx s
          (x, s'') = gx s'
       in (f x, s'')



--  stf <*> stx = S (\s -> let (f,s') = app stf s          -- Hutton
--                                  (x,s'') = app stx s' 
--                                  in (f x, s''))


instance Monad ST where
-- (>>=) :: ST a -> (a -> ST b) -> ST b
  st >>= f = S (\s -> let (x,s') = app st s
                          in app (f x) s')

