import Data.Monoid
import Data.Semigroup

newtype FirstExisting a = FirstExisting (Maybe a) deriving Show

instance Semigroup (FirstExisting a) where
  (<>) = mappend 

instance Monoid (FirstExisting a) where
  mappend (FirstExisting (Just a)) _ = FirstExisting (Just a)  
  mempty  = FirstExisting Nothing 
