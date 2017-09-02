-- wrong:
-- pal' :: String -> Bool -> String 

pal' :: String -> String
pal' xs =
  case y of
    True -> "yes"
    False -> "no"
  where y = xs == reverse xs

-- a more true version is:

palindrome :: String -> Bool 
palindrome xs = xs == reverse xs

-- composed breakdown : 

boolToString :: Bool -> String
boolToString b = case b of 
  True -> "yes" 
  False -> "no"

palbool :: String -> String 
palbool = pal' . boolToString
