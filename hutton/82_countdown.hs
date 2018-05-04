data Op = Add | Sub | Mul | Div 

instance Show Op where
  show Add = "+"
  show Sub = "-"
  show Mul = "*"
  show Div = "/"

valid :: Op -> Int -> Int -> Bool
valid Add _ _ = True
valid Sub x y = x > y
valid Mul _ _ = True
valid Div x y = mod x y == 0

apply :: Op -> Int -> Int -> Int
apply Add x y = x + y
apply Sub x y = x - y
apply Mul x y = x * y
apply Div x y = div x y

data Expr = Val Int | App Op Expr Expr

instance Show Expr where
        show (Val n)     = show n
        show (App o l r) = brak l ++ show o ++ brak r
          where
            brak (Val n) = show n
            brak e       = "(" ++ show e ++ ")"

values :: Expr -> [Int]
values (Val n) = [n]
values (App _ l r) = values l ++ values r

eval :: Expr -> [Int]
eval (Val n)     = [n | n > 0]
eval (App o l r) = [apply o x y | x <- eval l,
                                  y <- eval r,
                                  valid o x y]

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


-- alternative to subs :

subseqs :: [a] -> [[a]]
subseqs [] = [[]]
subseqs (x:xs) = (subseqs xs) ++ map (x:) (subseqs xs)

-- subs in GHI , written with nonEmptySubsequences : 

subsequences xs =  [] : neSubs xs

neSubs :: [a] -> [[a]]
neSubs []      =  []
neSubs (x:xs)  =  [x] : foldr f [] (neSubs xs)
  where f ys r = ys : (x : ys) : r

