applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b

applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n - 1) f b)

-- applyTimess n f b = f . applyTimess (n-1) f $ b


incTimes :: (Eq a, Num a) => a -> a -> a
incTimes times n = applyTimes times (* 2) n

applyTimess :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimess 0 f b = b
applyTimess n f b = f . applyTimess (n-1) f $ b
