{-# LANGUAGE RankNTypes #-}

foo :: (forall a. Num a => (a -> a)) -> Double -> Double 
bar :: (forall a. Num a => (a -> a)) -> Int -> Int

gad :: (forall a. Num a => (a -> a)) -> (Int, Double) -> (Int, Double) -- change first double to Int !

-- haskell knows gad is polymorphic enough to be applied to both an 
-- Int and a Double without breaking any rules

foo f x = f x
bar g x = g x 

gad h (x, y) = (h x, h y)
-- ghci> gad (*10) (5, 6)
-- (50, 60.0)

-- ghci> gad (*10) (5, 8.0)
-- (50, 80.0)

-- ghci> gad (*10) (2.0, 7.0)
-- ERROR




-- map :: (a -> b) -> [a] -> [b]
-- map :: forall a b. (a -> b) -> [a] -> [b]
