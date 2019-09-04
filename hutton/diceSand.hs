--  $ mkdir sandbox && cd sandbox

--  $ cabal sandbox init
--  $ cabal install random
--  $ cabal repl
--  > :l diceN.hs


import Control.Applicative
import System.Random
import Control.Monad

lifter f u v = f <$> u <*> v

rollDiceIO :: IO (Int,Int)
rollDiceIO = lifter (,) (randomRIO (1,6)) (randomRIO (1,6))

-- (liftA2 is renamed lifter)

-- one die:

rollNDieIO :: Int -> IO [Int]
rollNDieIO n = replicateM n $ (randomRIO (1,6))

-- two dice:

rollNDiceIO :: Int -> IO [(Int,Int)] 
rollNDiceIO n = replicateM n $ lifter (,) (randomRIO (1,6)) (randomRIO (1,6))


generatorR = mkStdGen 0
rg = random generatorR :: (Int, StdGen)






-- https://en.wikibooks.org/wiki/Haskell/Understanding_monads/State 
