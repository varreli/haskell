data TisAnInteger = TisAn Integer deriving Show

instance Eq TisAnInteger where
  (==) (TisAn a) (TisAn b) = a == b

-- ------------------------------------------------ 
data TwoIntegers = Two Integer Integer deriving Show

instance Eq TwoIntegers where
  (==) (Two r s) (Two r' s') =
    r == r' && s == s'

-- ------------------------------------------------
data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
   (==) (TisAnInt x) (TisAnInt y) = x == y
   (==) (TisAString v) (TisAString w) = v == w
   (==) _ _ = False
