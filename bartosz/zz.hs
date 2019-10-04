import Data.Monoid

data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a
    => Monoid (Optional a) where
              mempty = 
              mappend = 


main = print $ Only (Sum 1) `mappend` Only (Sum 8)

