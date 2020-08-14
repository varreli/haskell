import Control.Monad

tt = (Just 4) >>= \n -> return (negate n)

-- λ> tt
-- Just (-4) 
