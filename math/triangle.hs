triangular :: Int -> Int
triangular x = x * (x + 1) `div` 2

triSeries :: Int -> [Int]
triSeries x = take x $ map triangular [1..]

triSeries' :: Int -> [Int]
triSeries' x = [ list | list <- map triangular [1..x] ]
