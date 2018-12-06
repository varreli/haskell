aa :: [Maybe String] -> [Maybe String] 
aa = (<$>) (fmap (++ " !")) 


-- haskell assumes you intended a memoized value binding, 
-- and memoization only makes sense with a concrete type, 
-- so it monomorphizes. It needs a parameter on lhs :

-- bb :: (Functor f1, Functor f) => t -> f (f1 [Char]) -> f (f1 [Char]) 
bb :: (Functor f1, Functor f) => f (f1 [Char]) -> f (f1 [Char])
bb x = (<$>) (fmap (++ " !")) x   -- x must be show


-- With no eta reduction its equivalent to aa above :

cc :: [Maybe String] -> [Maybe String] 
cc x = (<$>) (fmap (++ " !")) x


-- With a concrete type (note dd signature) :

dd :: [Maybe String]
dd = (<$>) (fmap (++ "! ")) [(Just "Yo"), Nothing, (Just "Hey")]


-- In category theory, morphisms are a generalization of functions.
-- Monomorphisms correspond specifically to injective functions.
