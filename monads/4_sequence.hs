-- Using sequence:

-- ghci> import Control.Monad
-- ghci> :t sequence
-- sequence :: (Traversable t, Monad m) => t (m a) -> m (t a)

acts = [putStrLn "nice", putStrLn "move"] -- traversable list of IO 's
a = putStrLn "name" >> getLine

-- ghci> sequence acts
-- nice
-- move

-- ghci> sequence [a,a,a] -- prompts for three names
-- ghci> :t acts
-- [IO ()]
-- ghci> :t sequence acts
-- IO [()]

-- ghci> sequence_ [a,a]
-- sequence_ gives no result, ie [(), ()] OR ["John", "Trish"]
