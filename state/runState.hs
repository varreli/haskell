import Control.Monad.State.Lazy
ff = runState (return 'X') 1

-- > :t ff 
-- ff :: (Char, Int)
-- (returns both result and state though state is unchanged:)

-- > ff 
-- ('X',1)

-- > :t (return 'X') 
-- (return 'X') :: Monad m => m Char   
-- (return 'X') :: State Int Char     -- alternately: m in full is (State Int)

-- > :t runState 
-- runState :: State Int -> Int -> (Char, Int)
-- produces both:
-- > runState (return 'X') 1
-- ('X',1)

-- > :t evalState
-- evalState s a -> s -> a
-- produces only the result:
-- > evalState (return 'X') 1
-- 'X'   

-- > :t execState
-- State s a -> s -> s
-- produces only the final state: 
-- > execState (return 'X') 1
-- 1



