tt :: [(Bool, t)] -> (Bool, t)
tt = head . (filter fst) 
-- Prelude tt [(False, 3), (False, 2), (True, 1)]

-- filter :: (a -> Bool) -> [a] -> [a]
-- fst    :: (s, t) -> s

-- unify:

-- a ~ (s, t)
-- s ~ Bool 
-- a = (Bool, t)

-- Therefore filter fst has the type :
-- filter fst :: [a] -> [a]

-- Substitute a with our previous unification :
-- filter fst :: [(Bool, t)] -> [(Bool, t)]

-- The original function is :
-- head . (filter fst)

-- which can be rewritten :
-- (.) head (filter fst)

-- (.) :: (b -> c) -> (a -> b) -> a -> c

-- So for unification to succeed :
-- 1) head :: [a] -> a   must unify   (b -> c)
-- 2) (filter fst) :: [(Bool, t)] -> [(Bool, t)]   must unify   (a -> b)

-- From 2) we see that a IS b     (a -> b)   IS   [(Bool, t)] -> [(Bool, t)]

-- (.) head (filter fst) :: a -> c
-- From the unification in 1) we know that b is a list of c.
-- a is [(Bool, t)]
-- c is (Bool, t)

-- Therefore
-- head . (filter fst) :: [(Bool, t)] -> (Bool, t)

---------------------------------------------------------------------------

--  λ >  w = head . filter fst
-- 
--  λ > :t w
-- w :: [(Bool, b)] -> (Bool, b)
-- 
--  λ > w [(False, 4), (False, 5), (True, 14)]
-- (True,5)
-- 
-- -- The last tuple is the first one with `True` in the `fst` place.
-- 
-- **
-- 
--  λ > pp = filter fst
-- 
--  λ > head pp [(False, 4), (True, 5)]
-- ERROR
-- 
--  λ > head (pp [(False, 4), (True, 5)])
-- (True, 5)
