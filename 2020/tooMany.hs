import Control.Applicative
import Control.Monad

uu = join $ pure (*10) <*> Just 5 >>= \x -> Just (Just (x^2))

