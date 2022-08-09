-- WILL NOT RUN

ghci> let a = Just 1
ghci> :t a
a :: Num a => Maybe a

ghci> let f = \x -> Just (x+1)
:t f 
Num a => a -> Maybe a

-- using bind: 

ghci> a >>= f
Just 2

ghci> :t a >>= f
Num b => Maybe b

-- 2) 

ghci> let a = Just 1
:t a
a :: Num a => Maybe a

ghci> let h = return . show . (+1)
ghci> :t h
h :: (Monad m, Show a, Num a) => a -> m String

ghci> > a >>= h
Just "2"
