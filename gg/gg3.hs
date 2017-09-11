-- λ > :t const
-- const :: a -> b -> a
-- -- same as :
-- const :: a -> (b -> a)
--
-- λ > let gg :: (a -> b) -> a -> c -> b;
-- gg f a c = f a
--
-- λ > :t gg
-- gg :: (a -> b) -> a -> c -> b
--
-- λ > :t gg const
-- gg const :: a -> c -> b -> a

-- λ > :t gg const 1
-- gg const 1 :: Num a => c -> b -> a
--
-- λ > :t gg const 1 2
-- gg const 1 2 :: Num a => b -> a
--
-- λ > :t gg const 1 2 "t"
-- gg const 1 2 "t" :: Num a => a

-- λ > :t gg (flip const) "z" 10 2
-- gg (flip const) "z" 10 2 :: Num c => c

-- λ > gg (flip const) "z" 10 2
-- 2

-- λ > :t gg (flip const) 1 2 "t"
-- gg (flip const) 1 2 "t" :: [Char]

-- λ > gg not True "yy"
-- False
