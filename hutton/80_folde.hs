data Expr = Val Int | Add Expr Expr

folde :: (Int -> a) (a -> a -> a) -> Expr -> a

folde n f g
