-- class Functor f where
--    fmap :: (a -> b) -> f a -> f b

-- class Functor f => Applicative f where
--     pure :: a -> f a
--     (<*>) :: f (a -> b) -> f a -> f b


-- ghci> (+3) <$> (Just 8)
-- Just 11

-- Applicative allows us to wrap a function (here, in a Just) :

-- ghci (Just (+3)) <*> (Just 9)
-- Just 11

data Maybe2 a = Just2 a | Nothing2 deriving Show

instance Functor Maybe2 where
  fmap f (Just2 a) = Just2 (f a)
  fmap f Nothing2  = Nothing2

instance Applicative Maybe2 where
    pure = Just2
--  Just2 f <*> Just2 j = Just2 (f j) -- but easier to use fmap:
    Just2 f <*> j = fmap f j 
    Nothing2 <*> j = Nothing2

-- ghci> (*) <$> (Just 10) <*> (Just 3) 


--  $ is "the function application operator" 
--  <*> is "the appicative function application operator"
