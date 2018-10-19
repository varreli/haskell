module Propositions where

data Prop = Const Bool
          | Var   Char
          | Not   Prop
          | And   Prop Prop
          | Or    Prop Prop
          | Imply Prop Prop
          | Equiv  Prop Prop
          deriving Show

-- Truth Tables can be represented as :

p1 :: Prop
p1 = And (Var 'A') (Not (Var 'A'))

p2 :: Prop
p2 = Imply (And (Var 'A') (Var 'B')) (Var 'A')

p3 :: Prop
p3 = Imply (Var 'A') (And (Var 'A') (Var 'B'))

p4 :: Prop
p4 = Imply (And (Var 'A') (Imply (Var 'A') (Var 'B'))) (Var 'B')

p5 :: Prop
p5 = Imply (And (Var 'A') (Or (Var 'B') (Var 'C'))) (Or (And (Var 'A') (Var 'B')) (And (Var 'A') (Var 'C'))) 

-- p5 is a tautology and is from proofsProgs.txt on computerphile video ! :

-- P ^ (Q v R) -> P ^ Q  v  P ^ R

p6 :: Prop
p6 = Equiv (Imply (And (Var 'A') (Var 'B')) (Var 'C')) (Imply (Var 'A') (Imply (Var 'B') (Var 'C')))

-- p6 is from wikipedia: 
-- https://en.wikipedia.org/wiki/Tautology_(logic)#Definition_and_examples
