import Debug.Trace

import ShowExpression


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

-- to terminate, do: 
-- perms (x:xs) = trace "it terminates" concat (map (interleave x) (perms xs))


choices :: [a] -> [[a]]
choices = concat . map perms . subs 

-- variation with $ : 
-- choices xs = concat . map perms . subs $ xs  

split :: [a] -> [([a], [a])]
split []     = []
<<<<<<< HEAD
split [_]    = []                                              -- hangs without this
=======
split [_]    = []                                        --    hangs without this
>>>>>>> 7387f4dc9c6e28749b3f372ac3bfc3935297d1a4
split (x:xs) = ([x], xs) : [(x:ls, rs) | (ls, rs) <- split xs]

-- split [1,2,3] = ([1],[2,3]) : (1:[2], [3]) : [(1:2:3[], [])]
--                 [([1],[2,3]), ([1,2], [3]), ([1,2,3], []) ]

exprs :: [Int] -> [Expr]
exprs []  = []
exprs [n] = [Val n]
exprs ns = [e | (ls, rs) <- split ns,
                l        <- exprs ls,
                r        <- exprs rs,
                e        <- combine l r]

----------------------------------------------------------------
-- auxillary function combine in exprs:

combine :: Expr -> Expr -> [Expr]
combine l r = [App o l r | o <- ops]

ops :: [Op]
ops = [Add,Sub,Mul,Div]

-- -- -- auxiliary function for results ------------------------

type Result = (Expr, Int)

combine' :: Result -> Result -> [Result]
combine' (l, x) (r, y) =
  [(App o l r, apply o x y) | o <- ops, valid o x y]

-- Prelude> combine' (App Add (Val 2) (Val 2), 4) (App Mul (Val 3) (Val 1), 3)

results :: [Int] -> [Result]
results []  = []
results [n] = [(Val n, n) | n > 0]
results ns  = [res | (ls,rs) <- split ns,
                      lx     <- results ls,
                      ry     <- results rs,
                      res    <- combine' lx ry]

solve ns n =
  [e | ns' <- choices ns, (e, m) <- results ns', m == n]

-- main :: IO ()
-- main = print (totalSuccessful [1, 3, 7, 10, 25, 50])
main :: IO ()
main = print $ solve [1,3,7,10,25,50] 765
----------------------------------------------------------

removeFirst :: Eq a => a -> [a] -> [a]
removeFirst x []                = []
removeFirst x (y:ys) | x == y   = ys
                     | otherwise = y : removeFirst x ys
   
isChoice :: Eq a => [a] -> [a] -> Bool
isChoice [] _      = True
isChoice (x:xs) [] = False
isChoice (x:xs) ys = elem x ys && isChoice xs (removeFirst x ys)

----------------------------------------------------------

-- possibleExprs :: [Int] -> [Expr]
-- possibleExprs = concat . map exprs . choices
--  
-- successfulExprs :: [Int] -> [[Int]]
-- successfulExprs = filter (not . null) . map eval . possibleExprs
--  
-- totalPossible :: [Int] -> Int
-- totalPossible = length . possibleExprs
--  
-- totalSuccessful :: [Int] -> Int
-- totalSuccessful = length . successfulExprs
-----------------------------------------------------------
