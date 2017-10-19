gg :: (a -> b) -> a -> c -> b 
gg f a c = f a

-- > gg (+) 4 5 10
-- 14

-- > :t gg (+)
-- gg (+) :: Num a => a -> c -> a -> a
