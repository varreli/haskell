-- uncurry converts a curried function to a 
-- function on pairs, ie:  > uncurry (+) (8, 10) :

myUncurry :: (aa -> bb -> cc) -> (aa, bb) -> cc
-- here the typechecker will try to use aa, 
-- bb, cc - when appropriate. 
myUncurry f (aa, bb) = f aa bb

-- Prelude> :t myUncurry

-- Prelude> :t myUncurry (&&)
-- myUncurry (&&) :: (Bool, Bool) -> Bool

-- Prelude> myUncurry (&&) (True, True)
-- True

-- Prelude> myUncurry add (2,3)
-- 5

-- Prelude> :t myUncurry add
-- myUncurry add :: Num t=> (t,t) -> t

-- Prelude> :t myUncurry add (8,9)
-- myUncurry add (8,9) :: Num t => t

-- https://stackoverflow.com/questions/38362348/example-of-deep-understanding-of-currying
