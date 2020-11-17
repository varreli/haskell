module S where
import Prelude hiding (read)
import Control.Applicative
import Control.Monad (liftM, replicateM, ap) 

instance Functor     (S s) where        -- |
    fmap = liftM                        -- |  minimal instance
                                        -- |  declarations
instance Applicative (S s)  where       -- |
    pure  = return
    (<*>) = ap

data S s a = S { runS :: s -> (a,s) }  -- S s a == ST a  (hutton)

-- runS :: S s a -> s -> (a,s)   -- runS unwraps the S constructor
-- S :: (s -> (a,s)) -> S s a    -- refers to S constructor as function


instance Monad (S s) where  -- partial application to (S s)
                            -- monad must have kind * -> *

  -- return :: a -> S s a
  return a = S $ \s -> (a,s)  -- wrapped function
  -- (>>=) :: S s a -> (a -> S s b) -> S s b
  S st >>= k =
    -- st :: s -> (a,s)
    -- k :: a -> S s b
    S $ \s -> let (a, s') = st s 
                in runS (k a) s'

    -- k a           :: S s b      apply k to a to get S s b
    -- runS (k a)    :: s -> (b,s)
    -- runS (k a) s' :: (b,s)


read :: S s s
read = S $ \s -> (s,s)

write :: s -> S s ()
write s = S $ \_ -> ((),s)     -- \_ shows old state is discarded
-- write s = S $ \s -> ((),s)  -- note what happens without wildcard
--------------------------------------------------------------------
ff :: S Int Int
ff = do x <- read
        write (x+1)
        x <- read
        return (x*10)

ffTest :: (Int, Int)
ffTest = runS ff 4   -- has type (Int,Int) since: runS :: s -> (a,s)
--------------------------------------------------------------------
nextletter :: Int -> Char
nextletter iTc
    | toEnum iTc == 90 = 'A'
    | iTc < 65 || iTc > 90 = error "Not in the English alphabet"
    | otherwise = toEnum (iTc + 1)

gg :: S Int Char
gg = do x <- read
        return (nextletter x) 

ggTest :: Int -> (Char,Int)
ggTest = runS gg         
---------------------------------------------------------------------

tick :: S Int Int
tick = S $ \n -> (n,n+1)

ticker n = runS (replicateM n tick)
evenTick = map $ runS (fmap even tick)
