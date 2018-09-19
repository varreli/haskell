data Either a a' = Left a | Right a'

data Pair a a' = P a a'

data Const c a = Const c        -- ignores type argument a


()  -- Unit, Void, Singleton   ie  Const () a


-- These are all combinators, we combine them to get higher
-- order types. This starts to look like algebra, (*), (+).

-- Leaves on a Tree can be parameterized by types (templates)

data Expr = Const Int
          | Add Expr Expr   -- This is a product type (^2)
          | Mul Expr Expr   -- This is a product type (^2)


-- Note this is the sum of Const and two products :

Const Int a (+) Add a a (+) Mul a a


-- Functor the non-recursive data type; Functor uses the 
-- mapping of types. The data constructor uses the 
-- generic a type and not the type constructor (ExprF) :

data ExprF = Const Int
           | Add a a
           | Mul a a

ffmap :: (a -> b) -> (ExprF a -> ExprF b)
ffmap f (Const i) = Const i
ffmap f (Add x y) = Add (f x) (f y)
ffmap f (Mul x y) = Mul (f x) (f y)
 

-- With Add or Mul :

-- Add (f x) (f y)      -- we are operating on two a types 
-- Mul (f x) (f y)      -- and returning two b types.

data Maybe a = Nothing | Just a  

-- The kind of Maybe is * -> * 
-- It takes a type and returns a type.
-- This is what Functor needs.

-- map is a specific implementation of fmap to apply
-- functions to lists only.
-- fmap is the generalization of map. If we want to
-- apply a function to another data structure, say a
-- Tree, we use fmap.

fmap :: (a -> b) -> f a -> f b

-- fmap applies the function (a -> b) to everything in 
-- the data structure with elements a called f a . It then
-- returns that same data structure with the elements
-- transformed. fmap must know how to traverse the data
-- structure.

-- https://www.youtube.com/watch?v=4tXna2Al3Ps
