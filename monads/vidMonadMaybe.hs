data Maybe2 a = Just2 a | Nothing2 deriving Show

instance Functor Maybe2 where
    fmap func (Just2 val) = Just2 (func val)
    fmap func Nothing2 = Nothing2

instance Applicative Maybe2 where
    pure = Just2
    Just2 f <*> j = fmap f j
    Nothing2 <*> j = Nothing2 

instance Monad Maybe2 where
    Nothing2 >>= f = Nothing2
    Just2 val >>= f = f val -- half val --> Just2 val


bigger5 x = if x > 5
    then Just2 (x + 100)
    else Nothing2

half x = if even x
    then Just2 (div x 2)
    else Nothing2

