import Data.Monoid    hiding (<>) -- ?
import Data.Semigroup

-- fix 1

instance Monoid a => Semigroup (Optional a) where
      (<>) = mappend

instance Monoid a => Monoid (Optional a) where
      mempty = Nada
      mappend Nada Nada = Nada
      mappend (Only x) Nada = Only x
      mappend Nada (Only x) = Only x
      mappend (Only x) (Only y) = Only (x <> y)


 -- or fix 2

instance Semigroup a => Semigroup (Optional a) where
      Nada <> Nada = Nada
      Only x <> Nada = Only x
      Nada <> Only x = Only x
      Only x <> Only y = Only (x <> y)


instance Monoid a => Monoid (Optional a) where
      mempty = Nada
