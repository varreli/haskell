data Expr = Val Int | Add Expr Expr

type Cont = [Op]

data Op = EVAL Expr | ADD Int


exec :: Cont -> Int -> Int
exec []           n = n
exec (EVAL y : c) n = eval y (ADD n : c)
exec (ADD n : c)  m = exec c (n + m)

eval :: Expr -> Cont -> Int
eval (Val n)   c = exec c n
eval (Add x y) c = eval x (EVAL y : c)

value :: Expr -> Int
value e = eval e []

-- main = print $ value (Add (Add (Val 4) (Val 1)) (Val 10))


-- Cont represents a stack of things to do (aka a continuation)
-- after evaluating a subexpression.

-- EVAL and ADD are data constructors.

-- Op and Expr are type constructors.

-- this is called a proof using constructive induction.
