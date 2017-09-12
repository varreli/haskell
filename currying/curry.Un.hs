-- curry converts an uncurried function to a 
-- curried function, ie:

myCurry :: ((a, b) -> c) -> a -> b -> c
myCurry f a b = f (a, b)
-- Prelude> curry (&&)

addTuple (x,y) = x + y
-- addTuple (1,3)

adder p q = p + q
-- adder 1 3

-- curry is the function that turns addTuple 
-- into adder. Uncurry turns adder into addTuple.

