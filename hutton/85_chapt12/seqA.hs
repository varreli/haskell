import Debug.Trace

getChars :: Int -> IO String
getChars 0 = return []
getChars n = pure (:) <*> getChar <*> getChars (n-1)

-- more generalized is seqA (Library function sequenceA) :

seqA :: (Applicative f, Show a) => [f a] -> f [a]
seqA [] = pure []
seqA (x:xs) = pure (:) <*> x <*> seqA xs

getChars' :: Int -> IO [Char] 
getChars' n = seqA (replicate n getChar)  

-- You can't show IO actions. If you want to see how seqA 
-- proceeds, you will need to use an Applicative that can 
-- be shown, for example, ZipList or Maybe.

-- pure embeds the pure language into the impure DSL currently 
-- in use. "impure" is a convenient shorthand for "this pure 
-- computation that models an impure one in an effective way"

-- pure is an example of "return-type polymorphism", where 
-- the type of the return type of the function dictates 
-- which instance is dispatched:

-- > getChars' 18
-- Who likes ice crea             -- IO String applicative
-- "Who likes ice crea"

-- > pure ((*2) 5)
-- 10                             -- Integer IO applicative

-- > pure ((*2) 5) :: [Integer]
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

--  λ > import Data.Typeable
--  *Main Debug.Trace Data.Typeable

--  λ > let x = traceShow (typeOf x) $ pure 123 in x
--  IO Integer
--  123
