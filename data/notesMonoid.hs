-- A monoidal category has a tensor ⨂  and an identity I. A given 
-- category can be monoidal in different ways (the cartesian product 
-- being just one possible choice). A monoid object is a choice of 
-- (Object, ⨂, I) within a monoidal category. So, monads are a monoid 
-- object in the category of endofunctors by choosing 
-- 
-- ([C,C], Compose, Identity) 
-- 
-- Applicatives are a monoid object in the category of endofunctors by 
-- choosing ([C,C], Day, Identity)
-- 
-- A "monoid" as we use them is a monoid object in some monoidal category 
-- C where we choose cartesian products as the tensor. So a Haskell monoid 
-- would be (Type, (,), ()) within Hask (which is cartesian monoidal).

 -- A group is a monoid in which every element has an inverse. So the integers 
-- Z is a group (under addition):  3  has the inverse -3, since  3 + (-3) = 0.  
-- But the set {0,1,2,...} is only a monoid: it has the identity element 0, 
-- and the operation is associative, but 3 has no inverse in this set. Nor 
-- does anything else besides 0.
