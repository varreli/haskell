absurd :: Void -> a
 
-- (Remember, a is a type variable that can stand for 
-- any type.) There is deeper interpretation of types 
-- and functions in terms of logic called the 
-- Curry-Howard isomorphism.

f44 :: () -> Integer
f44 () = 44
> f44 ()
44

-- Notice that every function of unit is equivalent to picking 
-- a single element from the target type (here, picking the 
-- Integer 44). In fact you could think of f44 as a different 
-- representation for the number 44. This is an example of how 
-- we can replace explicit mention of elements of a set by talking 
-- about functions (arrows) instead. Functions from unit to any 
-- type A are in one-to-one correspondence with the elements of that set A.
