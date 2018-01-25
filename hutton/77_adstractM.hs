data Expr = Val Int | Add Expr Expr

type Control = [Op]

data Op = EVAL Expr | ADD Int


exec :: Control -> Int -> Int
exec []           n = n
exec (EVAL y : c) n = eval y (ADD n : c)
exec (ADD n : c)  m = exec c (n + m)

eval :: Expr -> Control -> Int
eval (Val n)   c = exec c n
eval (Add x y) c = eval x (EVAL y : c)

value :: Expr -> Int
value e = eval e []


-- main = print $ value (Add (Add (Val 4) (Val 1)) (Val 10))



-- Control represents a stack of things to do (aka a continuation)
-- after evaluating a subexpression.

-- EVAL and ADD are data constructors.

-- Op and Expr are type constructors.


-- evaluation :

-- value (Add (Add (Val 4) (Val 1)) (Val 10))
-- eval (Add (Add (Val 4) (Val 1)) (Val 10)) []
-- eval (Add (Val 4) (Val 1)) [EVAL (Val 10)]
-- eval (Val 4) [EVAL (Val 1), EVAL (Val 10)]
-- exec [EVAL (Val 1), EVAL (Val 10)] 4
-- eval (Val 1) [ADD 4, EVAL (Val 10)]
-- exec [ADD 4, EVAL (Val 10)] 1
-- exec [EVAL (Val 10)] 5
-- eval (Val 10) [ADD 5]
-- exec [ADD 5] 10
-- exec [] 15
-- => 15
