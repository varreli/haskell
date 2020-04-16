
newtype First a = First a deriving Show

instance Semigroup (First a) where
   a <> _ = a

-----------------------------------------

newtype Min a = Min a deriving Show

instance Ord a => Semigroup (Min a) where
   Min a <> Min b = Min (min a b)

