import Debug.Trace

import ShowExpression


subs :: [a] -> [[a]]
subs []     = [[]]
subs (x:xs) = yss ++ map (x:) yss
  where yss = subs xs

interleave :: a -> [a] -> [[a]]
interleave x []     = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)


perms :: [a] -> [[a]]  -- perms [2,3] won't terminate without trace

perms []     = [[]] 
perms (x:xs) = trace "it terminates" concat (map (interleave x) (perms xs))


choices :: [a] -> [[a]]
choices xs = [ list | yss <- subs xs,
                      list <- perms yss ]

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

solutions :: [Int] -> Int -> [Expr]
solutions ns n =
        [e | ns' <- choices ns, e <- exprs ns', eval e == [n]]

-- auxiliary function for results ------------------------

type Result = (Expr, Int)

combine' :: Result -> Result -> [Result]
combine' (l, x) (r, y) =
  [(App o l r, apply o x y) | o <- ops, valid o x y]

-- Prelude> combine' (App Add (Val 2) (Val 2), 4) (App Mul (Val 3) (Val 1), 3)

----------------------------------------------------------

results :: [Int] -> [Result]
results []  = []
results [n] = [(Val n, n) | n > 0]
results ns  = [res | (ls,rs) <- split ns,
                      lx     <- results ls,
                      ry     <- results rs,
                      res    <- combine' lx ry]

bestSolve ns n =
  [e | ns' <- choices ns, (e, m) <- results ns', m == n]

main :: IO ()
main = print (bestSolve [1, 3, 7, 10, 25, 50] 765)
