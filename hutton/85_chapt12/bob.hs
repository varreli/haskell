import Control.Monad.State.Lazy
ff = runState (return 'X') 1

-- > ff 
-- ('X',1)

-- > :t (return 'X')
-- (return 'X') :: Monad m => m Char

-- This is from the haskell wiki:

-- Primitives:
-- return: set the result value but leave the state unchanged. 
-- Comments:

-- return 'X' :: State Int Char
-- runState (return 'X') :: Int -> (Char, Int)
-- initial state = 1 :: Int
-- final value = 'X' :: Char
-- final state = 1 :: Int
-- result = ('X', 1) :: (Char, Int)
