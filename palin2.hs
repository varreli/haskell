pal' :: String -> String
pal' xs =
  case y of
    True -> "yes"
    False -> "no"
  where y = xs == reverse xs

boolToString :: Bool -> String
boolToString b = case b of 
  True -> "yes" 
  False -> "no"

palbool :: Bool -> String 
palbool = pal' . boolToString

-- palbool should be:  
-- 
-- `palbool = boolToString . palindrome`
-- I accidentally switched the function 
-- order in my head the first time, my bad. 
-- (You also have a typo, you write pal' 
-- instead of palindrome)
