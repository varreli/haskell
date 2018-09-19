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

-- Add (f x) (f y)      -- we are operating on two a types and
-- Mul (f x) (f y)      -- returning two b types.
