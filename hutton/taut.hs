-- The first step towards deciding if a 
-- proposition is a tautology is to declare
-- a type for propositions, with one
-- constructor for each of the 5 possible 
-- forms of propositions:


type Assoc k v = [(k,v)]

find :: Eq k   => k -> Assoc k v -> v
find k v       = head [v | (k', v) <- v, k == k']


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


-- To stay in sane territory, only pass types 
-- to :k and values to :t
