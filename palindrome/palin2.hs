palindrome :: String -> Bool 
palindrome xs = xs == reverse xs

boolToString :: Bool -> String
boolToString b = case b of 
  True -> "yes" 
  False -> "no"

palbool :: String -> String
palbool = boolToString . palindrome

