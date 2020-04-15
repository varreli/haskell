
-- newtype First a = First a deriving Show

-- instance Semigroup (First a) where
--    a <> _ = a



-- newtype Min a = Min a deriving Show

-- instance Ord a => Semigroup (Min a) where
--    Min a <> Min b = Min (min a b)


-------------------------------------------------------------
import Data.Monoid
import Data.Semigroup

newtype FirstExisting a = FirstExisting (Maybe a) deriving Show

instance Semigroup (FirstExisting a) where
  (FirstExisting (Just a)) <> _ = FirstExisting (Just a)
  -- (<>) _ other = other
  FirstExisting Nothing <> _ = FirstExisting Nothing
