data List a = Nil | Cons a (List a)
    deriving Show

instance Functor List where
  fmap f Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)


join :: List (List a) -> List a
join Nil = Nil
join (Cons xs xss) =  cat xs (join xss)

cat :: List a -> List a -> List a
cat Nil ys = ys
cat (Cons x xs) ys = Cons x (cat xs ys)

list1 = Cons 5 (Cons 10 Nil)
list2 = Cons 15 Nil


dd = cat (Cons (Cons 34 Nil) Nil) (Cons (Cons 44 Nil) Nil)
-- Cons (Cons 34 Nil) (Cons (Cons 44 Nil) Nil)

ee = join $ Cons (Cons 22 (Cons 34 Nil)) (Cons (Cons 44 Nil) Nil)
-- Cons 22 (Cons 34 (Cons 44 Nil))



-- main = print $ join $ Cons list1 (Cons list2 Nil)
