forbid :: (a -> Bool) -> [a] -> Maybe [a]
forbid _ [] = Just []
forbid p (x:xs) = if p x
  then Nothing
  else do
    remainder <- forbid p xs
    Just (x : remainder)

remove :: (a -> Bool) -> [a] -> [a]
remove _ [] = []
remove p (x:xs) = if p x
  then remove p xs
  else 
    let remainder = remove p xs
    in x : remainder

f = forbid (>= 1101) [4,5,6,7,800,1100,1200]
r = remove (> 30) [2,3,4,55]
filt = filter (> 30) [2,3,4,55]

-- study guard implementation of filter:
-- https://stackoverflow.com/questions/3011302/improve-my-haskell-implementation-of-filter
