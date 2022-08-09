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

tt = forbid (> 1100) [4,5,6,7,800,1100]

