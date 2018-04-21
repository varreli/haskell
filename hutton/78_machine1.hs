module TautChecker where

data Prop = Const Bool
          | Var   Char
          | Not   Prop
          | And   Prop Prop
          | Or    Prop Prop
          | Imply Prop Prop
          | Equiv  Prop Prop
          deriving Show

type Assoc k v = [(k,v)]
type Subst = Assoc Char Bool

find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k', v) <- t, k == k']

isTaut :: Prop -> Bool
isTaut p = and [eval s p | s <- substs p]

eval :: Subst -> Prop -> Bool
eval _ (Const   b) = b
eval s (Var     x) = find x s
eval s (Not     p) = not (eval s p)
eval s (And   p q) = eval s p && eval s q
eval s (Or    p q) = eval s p || eval s q
eval s (Imply p q) = eval s p <= eval s q
eval s (Equiv p q) = eval s p == eval s q

vars :: Prop -> [Char]
vars (Var     x) = [x]
vars (Const   _) = []
vars (Not     p) = vars p
vars (And   p q) = vars p ++ vars q
vars (Or    p q) = vars p ++ vars q
vars (Imply p q) = vars p ++ vars q
vars (Equiv p q) = vars p ++ vars q

bools :: Int -> [[Bool]]
bools 0 = [[]]
bools n = map (False:) bss ++ map (True:) bss
          where bss = bools (n - 1)

substs :: Prop -> [Subst]
substs p = map (zip vs) (bools (length vs))
           where vs = rmdups (vars p)

rmdups :: Eq a => [a] -> [a]
rmdups []     = []
rmdups (x:xs) = x : filter (/= x) (rmdups xs)
