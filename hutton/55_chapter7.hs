-- redefine functions:


take_while :: (a -> Bool) -> [a] -> [a]

take_while p [] = []
take_while p (x:xs)
  
  | p x = x : take_while p xs
  | otherwise = []


drop_while :: (a -> Bool) -> [a] -> [a]

drop_while p [] = []
drop_while p (x:xs)

  | p x = drop_while p xs
  | otherwise = x : xs


-- λ > drop_while (\x -> mod x 3 == 1) [10,13,16,16,22,31]
-- []

