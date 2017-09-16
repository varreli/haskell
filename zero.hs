numbers :: (Num a, Num b, Ord b) => b -> a

numbers x
  | x < 0 = -1
  | x == 0 = 0
  | x > 0 = 1


-- numbers :: (Num a, Num t, Ord t) => t -> a
