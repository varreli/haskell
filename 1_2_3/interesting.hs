import Data.Char (digitToInt) 
-- This converts '1' to 1, '2', to 2, and so on.
import Data.Char (toUpper)    
-- This converts any Char to its uppercase version

chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f a b = (f a) == b

example1 = chk digitToInt '1' 5
example2 = chk digitToInt '5' 5

example3 = chk toUpper 'a' 'A'

-- This compares a value of type b with a 
-- value of type a, given a conversion function 
-- from a to b.
-- First, apply the function to the value of 
-- type a, resulting in a value of type b, then
-- compare that value with the value of type b 
-- that you were given. It's a proof that will, 
-- for any type "b", let you compare two values 
-- of that type for equality.
