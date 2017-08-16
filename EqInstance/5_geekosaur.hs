data EitherOr a b = Hello a | Goodbye b 

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello xa) (Hello ya) = xa == ya 
  -- xa, ya :: a
  
  (==) (Goodbye xb) (Goodbye yb) = xb == yb 
  -- xb, yb :: b
  
  (==) _ _ = False


-- The first equation for (==) handles the 
-- Hello data constructor, whose type is a. 
-- The value-level a and b (or xa and ya 
-- above) are both that type.

-- The second equation handles the Goodbye 
-- data constructor, whose type is b. The
-- value-level a and b (or xb and yb above) 
-- both have type b.

-- both Hello and Goodbye have the same
-- functionality. Each can handle any type at 
-- this stage. The whole point is you have a 
-- single type which can now carry either of the
-- two types.

