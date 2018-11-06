euclid :: Int -> Int -> Int
euclid m n | m <= 0 && n <= 0 = error "GCD works for positive numbers only"
           | m == n = m
           | m < n = euclid m (n-m)
           | otherwise = euclid (m-n) n
