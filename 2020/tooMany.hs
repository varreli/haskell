import Control.Applicative
import Control.Monad

uu = join $ pure (*10) <*> Just 50 >>= \x -> Just (Just (x*2))

