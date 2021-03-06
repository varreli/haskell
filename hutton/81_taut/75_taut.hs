import Debug.Trace
import Propositions

type Assoc k v = [(k,v)]

find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k', v) <- t , k == k']


-- remove duplicates from 53_voter.hs :

rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : filter (/= x) (rmdups xs)


------ int2bit converter (integer to binary) :


unfold p h t x
  | p x = []
  | otherwise = h x : unfold p h t (t x)

type Bit = Int

int2bit :: Int -> [Bit]
int2bit = unfold (== 0) (`mod` 2) (`div` 2)

---------------------------------------------

type Subst = Assoc Char Bool

eval :: Subst -> Prop -> Bool
eval _ (Const b)    = b
eval s (Var x)      = find x s
eval s (Not p)      = not (eval s p)
eval s (And p q)    = eval s p && eval s q
eval s (Imply p q)  = eval s p <= eval s q
eval s (Or p q)     = eval s p || eval s q
eval s (Equiv p q)  = eval s p == eval s q


-- Const True is a tautology, since:
-- \x -> True is what Const True returns.


vars :: Prop -> [Char]
vars (Const _)   = []
vars (Var x)     = [x]
vars (Not p)     = vars p
vars (And p q)   = vars p ++ vars q
vars (Imply p q) = vars p ++ vars q
vars (Or p q)    = vars p ++ vars q
vars (Equiv p q)  = vars p ++ vars q

-----------------------------------------------------

bools :: Int -> [[Bool]]
bools n = map (reverse . map conv . make n . int2bit) range
    where
      range     = [0..(2^n)-1]
      make n bs = take n (bs ++ repeat 0)
      conv 0    = False                   -- convert 0 to False
      conv 1    = True                    -- convert 1 to True

-- recursive bool converter:


boolsR :: Int -> [[Bool]]
boolsR n | traceShow (n) False = undefined
boolsR 0 = [[]]

boolsR n = map (False:) bss ++ map (True:) bss
    where bss = boolsR (n - 1)

------------------------------------------------------

substs :: Prop -> [Subst]
substs p = map (zip vs) (boolsR (length vs))
    where vs = rmdups (vars p)

isTaut :: Prop -> Bool
isTaut p = and [eval s p | s <- substs p]


