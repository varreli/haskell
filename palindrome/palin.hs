palindrome0 :: Eq a => [a] -> Bool
palindrome0 x = x == (reverse x)

palindrome1 :: Eq a => [a] -> [a] -> Bool
palindrome1 a b = a == (reverse b)


-- note no Bool in signature :

palindrome2 :: String -> String   
palindrome2 xs =
  case y of
    True -> "yes"
    False -> "no"
  where y = xs == reverse xs


palindrome3 xs = 
  case xs == reverse xs of
    True  -> "yes"
    False -> "no"
