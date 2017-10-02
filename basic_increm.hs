incremTimes :: (Eq a, Num a) => a -> a -> a

incremTimes 0 n = n
incremTimes times n = 1 + (incremTimes (times - 1) n)
