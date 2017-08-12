data TisAnInteger = TisAn Integer deriving Show 

instance Eq TisAnInteger where
  (==) (TisAn a) (TisAn b) = a == b

 

data TwoIntegers = Two Integer Integer deriving Show

instance Eq TwoIntegers where
  (==) (Two r s) (Two r' s') = 
    r == r' && s == s'

data StringOrInt = TisAnInt Int | TisAString String

instance Eq TisAnInt where
  (==) (TisAnInt x) (TisAnInt y) =
    x == y

instance Eq TisAString where
  (==) (TisAString c) (TisAString d) =
    c == d
