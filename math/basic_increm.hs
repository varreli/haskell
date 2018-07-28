incremTimes :: (Eq a, Num a) => a -> a -> a

incremTimes 0 n = n
incremTimes times n = 1 + (incremTimes (times - 1) n)

-- inc 3 10 = 1 + ((inc 2) 10)
-- inc 3 10 = 1 + 1 + ((inc 1) 10)
-- inc 3 10 = 1 + 1 + 1 + (10)
-- >> 13

