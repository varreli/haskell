-- requires a hidden package:

-- λ> :set -package mtl

import Control.Monad.Cont
-- show
ex1 = do
    a <- return 1
    b <- return 10
    return $ a+b

test1 = runCont ex1 show
-- /show
main = print test1
