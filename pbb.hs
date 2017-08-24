{-# LANGUAGE GeneralizedNewtypeDeriving #-}

newtype Nada = Nada Double deriving (Eq, Show, Num)

instance Fractional Nada where
  (Nada x) / (Nada y) = Nada (x / y)
  recip (Nada n) = Nada (recip n)
  fromRational r = Nada (fromRational r)

-- Prelude>
-- No instance for (Num Nada)
-- arising from the superclasses
-- of an instance declaration
-- In the instance declaration for
-- ‘Fractional Nada’
