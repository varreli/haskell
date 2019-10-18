import Data.Monoid

data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
        mempty = Nada
        mappend Nada Nada = Nada
        mappend (Only x) Nada = Only x
        mappend Nada (Only x) = Only x
        mappend (Only x) (Only y) = Only (x <> y)


ss = print $ Nada `mappend` Only (Sum 8)
-- λ > ss
-- Only (Sum {getSum = 8})

tt = print $ mappend (Only (Product 5)) (Only (Product 7))
-- λ > tt
-- Only (Product {getProduct = 35})

uu = print $ mappend (Only (Product 11)) ((Only (Product 5)) <> (Only (Product 7)))
-- mappend and <> used here.

-- λ > uu
-- Only (Product {getProduct = 385})

-- λ > getSum (mconcat [(Sum 12), (Sum 44)])
-- 56

-- λ > mconcat [(Sum (Only 12)), (Sum (Only 44))]   -- using mconcat & the List Monoid


