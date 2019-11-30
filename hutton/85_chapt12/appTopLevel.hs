data List a = Nil | Cons a (List a) deriving Show

app :: List a -> List a -> List a 
app Nil ys = ys
app (Cons x xs) ys = Cons x (app xs ys)

-- > app (Cons 0 (Cons 5 Nil)) (Cons 10 (Cons 15 Nil))
-- Cons 0 (Cons 5 (Cons 10 (Cons 15 Nil))) 

-- ( After Cons 5, the base case is reached -- app Nil ys = ys )




