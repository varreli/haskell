myFibs = takeWhile (< 144) x
  where x = 1 : 1 : zipWith (+) x (tail x)

-- > let x = 1 : 1 : zipWith (+) x (tail x) in takeWhile (< 144) x

-- try with two separate functions..
