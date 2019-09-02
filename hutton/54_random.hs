-- NOTE requires a cabal sandbox and import System.Random
-- see:  ~/haskell/makeSandbox

yourRand :: IO ()
yourRand = do
    num <- randomRIO (1,2358616) :: Int IO
    putStrLn ("This is your random number: " ++ show num)
