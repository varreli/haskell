data List a = Nil | Cons a (List a)

len' :: List a -> Int
len' Nil = 0
len' (Cons _ xs) = 1 + len' xs
