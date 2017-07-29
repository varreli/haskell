myCurry f a b = f (a, b)
-- Prelude> curry (&&)

addTuple (x,y) = x + y
-- addTuple (1,3)

add p q = p + q
-- add 1 3

-- curry is the function that turns addTuple 
-- into add. Uncurry turns add into addTuple.

myUncurry :: (aa -> bb -> cc) -> (aa, bb) -> cc
-- ; myUncurry f (aaa,bbb) = f aaa bbb
-- the typechecker will try to use aa, bb, cc 
-- as appropriate when working with the type 
-- of a value involving myUncurry

myUncurry f (aa, bb) = f aa bb
-- Prelude> :t myUncurry
-- myUncurry :: (bb -> aa ->  

-- Prelude> :t myUncurry (&&)
-- myUncurry (&&) :: (Bool, Bool) -> Bool
--
-- Prelude> myUncurry add (2,3)
-- 5

-- Prelude> :t myUncurry add
-- myUncurry add :: Num t=> (t,t) -> t

-- Prelude> :t myUncurry add (8,9)
-- myUncurry add (8,9) :: Num t => t
