factor :: Integer -> [Integer]

factor 1 = []
factor n = let divisors = dropWhile ((/= 0) . mod n) [2 .. ceiling $ sqrt $ fromIntegral n]
           in let prime = if null divisors then n else head divisors
              in (prime :) $ factor $ div n prime


totient n = round $ (fromIntegral n) * (product $ map (\x -> 1 - 1/(fromIntegral x)) (factor n))
