data List a = Nil | Cons a (List a) deriving Show

app :: List a -> List a -> List a 
app Nil ys = ys
app (Cons x xs) ys = Cons x (xs `app` ys)

