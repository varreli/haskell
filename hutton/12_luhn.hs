luhn :: Int -> Int
luhn x 
  | x * 2 > 9 = (-) (x * 2) 9
  | otherwise = x * 2


luhn4 :: Int -> Int -> Int -> Int -> Bool
luhn4 i j k l
  | mod (luhn i + j + luhn k + l) 10 == 0 = True
  | otherwise = False
 

-- λ > luhn4 4 5 6 1
-- False
