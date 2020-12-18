module Main where

data Compose f g a = Compose
  { getCompose :: f (g a)
  } deriving Show
-----------------------------------------------------------------------------------
instance (Functor f, Functor g) => Functor (Compose f g) where
-- fmap f c = _a    -- use hole. c is the Compose functor. Then we unwrap the hole:
-- fmap f c = Compose _a    -- this gives the type of a in the error:
-- Compose f g b (the composition of f and g.)
-- In the error context, we have c :: Compose f g a
-- _a :: f g b
-- c  :: f g a       -- we need to fmap the function f into (g a)
-- f  :: (a -> b)    -- to go from (f g a) -> (f g b)

-- so we go from:
-- fmap f (Compose c) = Compose (_a <$> c)   

-- to the complete definition:
  fmap f (Compose c) = Compose ((f <$>) <$> c)
-- (here double penetration is hidden from the user)
-----------------------------------------------------------------------------------

-- use case of double penetration:
-- rr = ((*10) <$>) <$> Just [1..5]

-- -- ss = (+5) <$> Compose (Just [5..10])

-- Compose merged the two functors together (From rr) and 
-- exposes the interface of a single functor. The behavior
-- is like 2 functors' penetrationi.

-- -- tt = getCompose ((+5) <$> Compose (Just [1..5])) -- unwraps data constructor.
-- ghci> tt
-- Just [6,7,8,9,10]


-- -- uu = getCompose (((+5) . (*2)) <$> Compose (Just [1..5])) 

-- Now for proving Applicative:
-- ghci> :t ((+) <$> Just 5)
-- ((+) <$> Just 5) :: Num a => Maybe (a -> a)

-- ghci> ((+) <$> Just 5) <*> Just 6
-- Just 11




main :: IO ()
main = undefined
