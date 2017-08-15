data StringOrInt = TisAnInt Int | TisAString String deriving Show
instance Eq StringOrInt where
  (==) (TisAnInt a) (TisAnInt b) = a == b
  (==) (TisAString p) (TisAString q) = p == q
  (==) _ _ = False
