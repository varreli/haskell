f :: (x -> y) -> (y -> z) -> c -> (a, x) -> (a, z)
f xToY yToZ _ (a, x) = (a, (yToZ (xToY x)))


