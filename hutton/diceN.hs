-- $ mkdir sandbox && cd sandbox

-- $ cabal sandbox init
-- $ cabal install random
-- $ cabal repl
-- > :l dice.hs


import Control.Applicative
import System.Random
import Control.Monad

lifter f u v = f <$> u <*> v

rollDiceIO :: IO (Int,Int)
rollDiceIO = lifter (,) (randomRIO (1,6)) (randomRIO (1,6))


-- (liftA2 is renamed lifter)


rollNDiceIO :: Int -> IO [Int]
rollNDiceIO n = replicateM n $ (randomRIO (1,6))
