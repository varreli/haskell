data EitherOr a b = Hello a | Goodbye b 

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello b) = a == b
  (==) (Goodbye a) (Goodbye b) = a == b
  (==) _ _ = False


-- The first equation for (==) handles the 
-- Hello data constructor, whose type is a. 
-- The value-level a and b are both that type.

-- The second equation handles the Goodbye 
-- data constructor; here, the original's 
-- value-level a and b have type b.

-- both Hello and Goodbye have the same
-- functionality. Each can handle any type at 
-- this stage. The whole point is you have a 
-- single type which can now carry either of the
-- two types.
