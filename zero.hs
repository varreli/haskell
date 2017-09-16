numbers :: (Num a, Ord a) => a -> a
numbers x
  | x < 0 = -1 
  | x == 0 = 0
  | x > 0 = 1


-- The return values here are polymorphic.
-- This signature forces the result type to be 
-- the same as the input value (the parameter), 
-- so it defaults to Double :
--
--  Prelude> numbers (-1.0)
--  -1.0


nums :: (Ord t, Num t, Num a) => t -> a
nums x
  | x < 0 = -1 
  | x == 0 = 0
  | x > 0 = 1

-- Here, the return value defaults separately 
-- from the input value. Numeric literals do not 
-- specify their types beyond the minimum required: 
-- a Fractional constraint if it has a decimal 
-- point, a Num constraint if it doesn't.
