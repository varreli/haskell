data EitherOr a b = Hello a | Goodbye b 

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello xa) (Hello ya) = xa == ya 
  -- xa, ya :: a
  
  (==) (Goodbye xb) (Goodbye yb) = xb == yb 
  -- xb, yb :: b
  
  (==) _ _ = False

