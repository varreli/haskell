
type Assoc k v = [(k,v)]

find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k', v) <- t , k == k']


type Subst = Assoc Char Bool

data Prop = Const Bool
          | Var Char
          | Not Prop
          | And Prop Prop
          | Imply Prop Prop

eval :: Subst -> Prop -> Bool
eval _ (Const b)   = b
eval s (Var x)     = find x s
eval s (Not p)     = not (eval s p)
eval s (And p q)   = eval s p && eval s q
eval s (Imply p q) = eval s p <= eval s q

-- Const True is a tautology, since:
-- \x -> True is what Const True returns.

-- Truth Tables can be represented as :

p1 :: Prop
p1 = And (Var 'A') (Not (Var 'A'))

p2 :: Prop
p2 = Imply (And (Var 'A') (Var 'B')) (Var 'A')

p3 :: Prop
p3 = Imply (Var 'A') (And (Var 'A') (Var 'B'))

p4 :: Prop
p4 = Imply (And (Var 'A') (Imply (Var 'A') (Var 'B'))) (Var 'B')

vars :: Prop -> [Char]
vars (Const _)   = []
vars (Var x)     = [x]
vars (Not p)     = vars p
vars (And p q)   = vars p ++ vars q
vars (Imply p q) = vars p ++ vars q

-- -- -- --

type Bit = Int

int2bit :: Int -> [Bit]
int2bit = unfold (== 0) (`mod` 2) (`div` 2)

unfold p h t x
  | p x = []
  | otherwise = h x : unfold p h t (t x)

-- -- -- --

bools :: Int -> [[Bool]]
bools n = map (reverse . map conv . make n . int2bit) range
    where
      range     = [0..(2^n)-1]
      make n bs = take n (bs ++ repeat 0)
      conv 0    = False
      conv 1    = True

-- To stay in sane territory, only pass types 
-- to :k and values to :t
