import Data.Monoid

data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
        mempty = Nada
        mappend Nada Nada = Nada
        mappend (Only x) Nada = Only x
        mappend Nada (Only x) = Only x
        mappend (Only x) (Only y) = Only (x <> y)


ss = print $ Nada `mappend` Only (Sum 8)
tt = print $ mappend (Only (Product 5)) (Only (Product 7))
