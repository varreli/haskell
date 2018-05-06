import ShowExpressions


subs :: [a] -> [[a]]
subs []     = [[]]
subs (x:xs) = yss ++ map (x:) yss
  where yss = subs xs

interleave :: a -> [a] -> [[a]]
interleave x []     = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)

perms :: [a] -> [[a]]
perms []     = [[]]
perms (x:xs) = concat (map (interleave x) (perms xs))

choices :: [a] -> [[a]]
choices = concat . map perms . subs

-- choices xs = concat . map perms . subs $ xs

solution :: Expr -> [Int] -> Int -> Bool
solution e nums n = elem (values e) (choices nums) 
                  && eval e == [n] 

-- λ > solution (App Mul (App Add (Val 50) (Val 1)) (App Sub (Val 25) (Val 10))) [1,3,7,10,25,50] 765
-- True

split :: [a] -> [([a], [a])]
split []     = []
split [_]    = []
split (x:xs) = ([x], xs) : [(x:ls, rs) | (ls, rs) <- split xs]

-- auxillary function combine in exprs:

combine :: Expr -> Expr -> [Expr]
combine l r = [App o l r | o <- ops]

ops :: [Op]
ops = [Add,Sub,Mul,Div]

--

exprs :: [Int] -> [Expr]
exprs []  = []
exprs [n] = [Val n]
exprs ns  = [ e | (ls, rs) <- split ns,
                  l        <- exprs ls,
                  r        <- exprs rs,
                  e        <- combine l r] 
