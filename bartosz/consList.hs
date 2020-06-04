data List a = Nil | Cons a (List a)
    deriving Show

join :: List (List a) -> List a
join Nil = Nil
join (Cons xs xss) =  cat xs (join xss)

cat :: List a -> List a -> List a
cat Nil ys = ys
cat (Cons x xs) ys = Cons x (cat xs ys)

l1 = Cons 1 (Cons 2 Nil)
l2 = Cons 3 Nil

main = print $ join $ Cons l1 (Cons l2 Nil)
