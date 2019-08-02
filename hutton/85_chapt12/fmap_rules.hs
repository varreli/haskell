-- To reverse a list using fmap, first declare your own list 
-- type and modify the below declaration accordingly,
-- to avoid clashing with the built-in list functor:


-- data List a = Nil | Cons a (List a)
-- 
-- instance Functor List where
-- -- fmap :: (a -> b) -> f a -> f b
-- 
--   fmap g Nil = Nil 
--   fmap g (Cons x xs) = Cons (g x) (fmap g xs)

-- This is fmap that returns normal sequence in list

------------------------------------------------------------------

data List a = Nil | Cons a (List a) deriving Show

instance Functor List where
        -- fmap:: (a -> b) -> List a -> List b
        fmap _ Nil = Nil
        fmap g (Cons x xs) = fmap g xs `app` Cons (g x) Nil
                where
                app :: List a -> List a -> List a
                app Nil ys = ys
                app (Cons x xs) ys = Cons x (xs `app` ys)


-- this fmap reverses the list Functor, which breaks the
-- first functor law:

-- fmap id = id

-- > fmap id (Cons 1 (Cons 2 (Cons 3 Nil)))
-- Cons 3 (Cons 2 (Cons 1 Nil))
