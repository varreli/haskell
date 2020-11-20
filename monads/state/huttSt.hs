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

read :: ST Int
read = S $ \s -> (s,s)

write :: State -> ST ()         -- compare to seanS:
write s = S $ \_ -> ((),s)      -- write :: s -> S s ()
--------------------------------------------------------------
gg :: ST Int
gg = do x <- read
        write (x+1)        
        x <- read
        return (x*10)

ggTest = unwrap gg 6
--------------------------------------------------------------

safeDiv :: Int -> Int -> Either String Int
safeDiv x 0 = Left "Division by Zero Error"
safeDiv x y = Right (div x y)

-- fails with state (-1) : 

divvy :: ST (Either String Int) 
divvy = do x <- read
           write (x+1)
           x <- read
           return (safeDiv (x*2) x)

