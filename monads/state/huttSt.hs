import Control.Monad
import Prelude hiding (read)

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

instance Applicative ST where
 -- pure :: a -> ST a
    pure x = S (\s -> (x,s))
 -- (<*>) :: ST (a -> b) -> ST a -> ST b
    stf <*> stx = S (\s -> let (f,s')  = (unwrap stf) s 
                               (x,s'') = (unwrap stx) s' 
                               in (f x, s''))


instance Monad ST where
  return x = S $ \s -> (x,s)
  S state >>= f = 
    S $ \s -> let (x,s') = state s
                in unwrap (f x) s' 

read :: S s s
read = S $ \s -> (s,s)

write :: s -> S s ()
write = S $ \_ -> ((), s)

gg :: S Int Char
gg = do x <- read
        write (x)
        y <- read
        return y





