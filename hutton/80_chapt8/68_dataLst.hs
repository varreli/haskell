data List a = Nil | Cons a (List a)

len' :: List a -> Int
len' Nil = 0
len' (Cons _ xs) = 1 + len' xs

--  λ > len' (Cons 1  (Cons 1 (Cons 1 (Cons 1 (Cons 1 Nil)))))
--  5

-- λ > len' (Cons "a"  (Cons "b" (Cons "c" (Cons "d" (Cons "e" Nil)))))
-- 5
 

