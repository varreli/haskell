palindrome x = x == (reverse x)

-- prelude> :t palindrome
-- palindrome :: Eq a => [a] -> Bool

palindrome2 a b = a == (reverse b)

-- prelude> :t palindrome2
-- palindrome2 :: Eq a => [a] -> [a] -> Bool
