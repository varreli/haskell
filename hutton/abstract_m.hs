data Expr = Val Int | Add Expr Expr

value :: Expr -> Int

value (Val n) = n
value (Add x y) = value x + value y

main = print $ value (Add (Add (Val 4) (Val 1)) (Val 10))
