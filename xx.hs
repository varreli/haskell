import Data.List

young :: [Char] -> Char
young xs = head (sort xs)


young' :: Ord a => [a] -> a
young' xs = head (sort xs)

-- young' is being given its natural type 
-- signature (what it would have if you let 
-- it be inferred). young has a more specific 
-- signature.
