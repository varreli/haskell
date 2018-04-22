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
