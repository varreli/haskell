ff :: A -> [B]
gg :: B -> [C]
hh :: A -> [C]

hh x = concat zs 
    where zs = concat [gg y | y <- ff x]


-- As monad :

-- hh x = ff x >>= gg
-- hh = ff >=> gg


-- stackoverflow.com/questions/27265920/what-is-non-determinism-in-haskell
