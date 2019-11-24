-- Study only, do not compile:

infixl 1  >>, >>=
class  Monad m  where
       (>>=) :: m a -> (a -> m b) -> m b

       -- ma >>= \v -> mb combines a monadic value 
       -- ma containing values of type a and a function 
       -- which operates on a value v of type a, 
       -- returning the monadic value mb. 
       

       (>>) :: m a -> m b -> m b

       -- used when the function does not need the value 
       -- produced by the first monadic operator:

       m >> k           = m >>= \_ -> k



       return :: a -> m a

       -- the return operation injects a value into the 
       -- monad (container).

  
       fail   :: String -> m a




-- https://www.haskell.org/tutorial/monads.html
