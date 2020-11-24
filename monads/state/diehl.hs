import Control.Applicative
import Control.Monad

instance Functor (State s) where        -- |
    fmap = liftM                        -- |  minimal instance
                                        -- |  declarations
instance Applicative (State s) where    -- |
    pure  = return
    (<*>) = ap

newtype State s a = State { runState :: s -> (a,s) }

instance Monad (State s) where
  return a = State $ \s -> (a, s)

  State act >>= k = State $ \s ->
    let (a, s') = act s
      in runState (k a) s'

get :: State s s
get = State $ \s -> (s, s)

put :: s -> State s ()
put s = State $ \_ -> ((), s)

modify :: (s -> s) -> State s ()
modify f = get >>= \x -> put (f x)

evalState :: State s a -> s -> a
evalState act = fst . runState act

execState :: State s a -> s -> s
execState act = snd . runState act

test :: State Int Int
test = do x <- put 3
          modify (+1)
          x <- get
          return (x*10) 

main :: IO ()
main = print $ runState test 0
-- (40,4)

