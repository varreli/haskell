-- Define a higher-order function such that folde f g 
-- replaces each `Val` constructor in an expression by 
-- the function `f`, and each `Add` constructor by the 
-- function `g`.

data Expr = Val Int | Add Expr Expr

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a

folde f g (Val x) = f x
folde f g (Add x y) = g (folde f g x) (folde f g y)

-- Using folde , define a function eval that evaluates
-- an expression to an integer value, and a function
-- size the gives the number of values in an expression.

eval :: Expr -> Int
eval = folde (+ 0) (+)

size :: Expr -> Int
size = folde (\_ -> 1) (+)

