-- The first step towards deciding if a 
-- proposition is a tautology is to declare
-- a type for propositions, with one
-- constructor for each of the 5 possible 
-- forms of propositions:

data Prop = Const Bool
          | Var Char
          | Not Prop
          | And Prop Prop
          | Imply Prop Prop


-- Const True is a tautology, since:
-- \x -> True is what Const True returns.
