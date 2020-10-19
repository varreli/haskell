λ> import Control.Applicative

-- @[] is an extension telling pure that our f is [] (a list) :

> :t pure @[] (*)
 Num a => [a -> a -> a]

> :t pure @[] ((*), (+))
(Num a1, Num a2) => [(a1 -> a1 -> a1, a2 -> a2 -> a2)]

-- it's not obvious just from the types here that @[] 
-- is a single item list, but that stems from how 
-- pure is defined for [], pure a = [a]

λ> :t pure
pure :: Applicative f => a -> f a

λ> import Control.Applicative

λ> :t []
[] :: [a]

λ> :t pure []
pure [] :: Applicative f => f [a]

λ> fmap ((:) 2) []
[]

λ> fmap ((:) 2) (pure [])
[2]

λ> :t fmap ((:) 2) (pure [])
fmap ((:) 2) (pure []) :: (Num a, Applicative f) => f [a]

-- (Prelude sees Applicative f in the constraint as IO ^ ) -----

λ> Just ((:) 4) <*> (Just []) 
Just [4]

λ> Just ((:) 4) <*> (pure []) 
Just [4]

-- KEY:

-- https://stackoverflow.com/questions/22878286/haskell-applicative-why-can-i-not-replace-pure-with-in-function
