ff :: A -> [B]
gg :: B -> [C]
hh :: A -> [C]

hh x = concat zs 
    where zs = concat [gg y | y <- ff x]


-- As monad :

-- h x = f x >>= g
-- h = f >=> g


-- stackoverflow.com/questions/27265920/what-is-non-determinism-in-haskell
