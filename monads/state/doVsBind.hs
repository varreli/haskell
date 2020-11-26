import HuttSt
import Prelude hiding (read)
binder = read >>= \x -> write (x+1) >>= \_ -> read >>= \x -> return (safeDiv (x*2) x)
