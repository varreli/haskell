import HuttSt
import Prelude hiding (read)

binder :: ST (Either String Int)
binder = read >>= \x -> write (x+1) >>= \_ -> read >>= \x -> return (safeDiv (x*2) x)

-- we bind the result of read to x; it's the a in the first place of the 
-- tuple (a,s) . The a is what the Monad instance acts upon and >>= is 
-- from Monad. read puts the same value into both sides of the tuple (s,s) .

-- \_ is when we don't need to name the result of an action; we're not using 
-- the result. So:

-- do x
--    y

-- is equivalent to:
-- x >>= \_ -> y

binderr :: ST (Either String Int)
binderr =
        do x <- read
           write (x+1)
           x <- read
           return (safeDiv (x*2) x)
