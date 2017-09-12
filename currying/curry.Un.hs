myCurry :: ((a, b) -> c) -> a -> b -> c
myCurry f a b = f (a, b)
-- Prelude> curry (&&)

addTuple (x,y) = x + y
-- addTuple (1,3)

adder p q = p + q
-- adder 1 3

-- curry is the function that turns addTuple 
-- into adder. Uncurry turns adder into addTuple.

myUncurry :: (aa -> bb -> cc) -> (aa, bb) -> cc
-- here the typechecker will try to use aa, 
-- bb, cc - when appropriate. 
myUncurry f (aa, bb) = f aa bb
-- Prelude> :t myUncurry

-- Prelude> :t myUncurry (&&)
-- myUncurry (&&) :: (Bool, Bool) -> Bool
--
-- Prelude> myUncurry add (2,3)
-- 5

-- Prelude> :t myUncurry add
-- myUncurry add :: Num t=> (t,t) -> t

-- Prelude> :t myUncurry add (8,9)
-- myUncurry add (8,9) :: Num t => t
