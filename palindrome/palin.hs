-- this is wrong because with the bool in 
-- the type signature, the function is not 
-- allowed to use its own boolean. Instead
-- it takes a Bool as input:

-- palindrome :: String -> Bool -> String


palindrome :: String -> String
palindrome xs =
  case y of
    True -> "yes"
    False -> "no"
  where y = xs == reverse xs


-- Alternatively, you can write it as:
palindrome' xs = 
  case xs == reverse xs of
    True  -> "yes"
    False -> "no"
