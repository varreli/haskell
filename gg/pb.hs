gg :: (a -> b) -> a -> c -> b
gg f a c = f a

-- note gg and (+) unify and require a 
-- third parameter :

-- λ > gg (+) 1 2 3 
-- 4
