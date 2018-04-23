data Expr = 
    Val Int 
    | Add Expr Expr
    | Mult Expr Expr


data Op = 
      ADD Expr 
    | MULT Expr
    | PLUS Int
    | TIMES Int

type Cont = [Op]

exec :: Cont -> Int -> Int
exec []            n = n
exec (ADD y : c)   n = eval y (PLUS n : c)
exec (MULT y : c)  n = eval y (TIMES n : c)
exec (PLUS n : c)  m = exec c (n + m)
exec (TIMES n : c) m = exec c (n * m)

eval :: Expr -> Cont -> Int
eval (Val n)    c = exec c n
eval (Add x y)  c = eval x (ADD  y : c)
eval (Mult x y) c = eval x (MULT y : c)

value :: Expr -> Int
value e = eval e []

-- main = print $ value (Add (Add (Val 4) (Val 1)) (Val 10))

-- main = print $ value (Val 5)

-- multiply:
main = print $ value (Mult (Add (Val 3) (Val 2)) (Mult (Val 10) (Val 2)))
