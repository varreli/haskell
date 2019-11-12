import Control.Monad.State.Lazy
ff = runState (return 'X') 1
