{-# LANGUAGE GeneralizedNewtypeDeriving #-}

newtype Nada = Nada Double
  deriving (Eq, Show, Num)

instance Fractional Nada where
  (Nada x) / (Nada y) = Nada (x / y)
  recip (Nada n) = Nada (recip n)
  fromRational r = Nada (fromRational r)

-- newtype is basically(*) like data, except
-- only a single data constructor is allowed -
-- further, it must take exactly one argument.
