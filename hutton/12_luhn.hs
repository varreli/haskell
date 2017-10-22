luhn :: Int -> Int
luhn x 
  | x * 2 > 9 = (-) (x * 2) 9
  | otherwise = x * 2


luhn4 :: [Int] -> [Int] -> [Int]
luhn4 (x:x1:x2:x3) list

  | x2 * 2 > 9 = (:) (luhn x2) list
  | x1 * 2 > 9 = (:) (luhn x1) list
  | x  * 2 > 9 = (:) (luhn  x) list
  | otherwise = list
