{-# Language GeneralizedNewtypeDeriving #-} 

newtype Nada = Nada Double 
  deriving (Eq, Show, Num, Fractional)

instance Fractional Nada where
  (Nada x) / (Nada y) = Nada (x / y)
  recip (Nada n) = Nada (recip n)
  fromRational r = Nada (fromRational r)
