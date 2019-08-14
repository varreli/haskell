getChars :: Int -> IO String
getChars 0 = return []
getChars n = pure (:) <*> getChar <*> getChars (n-1)

-- more generalized is seqA (Library function sequenceA) :

seqA :: Applicative f => [f a] -> f [a]
seqA [] = pure []
seqA (x:xs) = pure (:) <*> x <*> seqA xs

getChars' :: Int -> IO String
getChars' n = seqA (replicate n getChar)


-- pure is an example of "return-type polymorphism", where 
-- the type of the return type of the function dictates 
-- which instance is dispatched:

-- > getChars' 18
-- Who likes ice crea             -- IO String applicative
-- "Who likes ice crea"

-- > pure ((*2) 5)
-- 15                             -- Integer IO applicative

-- > pure (*2) 5) :: [Integer]
-- [10]                           -- explicit list return

-- > pure "123"                   -- IO [Char] applicative

------------------------------------------------------------

-- IO applicative read; each return type is a different 
-- implementation of read :

-- > read "True" || False
-- True

-- > read "5" + 10
-- 15                           

--------------------------------------- Trace study:

--  λ > import Data.Debug.Trace
--  *Main Debug.Trace

--  λ > import Data.Typeable
--  *Main Debug.Trace Data.Typeable

--  λ > let x = traceShow (typeOf x) $ pure 123 in x
--  IO Integer
--  123
