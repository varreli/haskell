-- addOneIfOdd :: Integral a => a -> a
-- addOneIfOdd n
--   | odd n = f n
--   | otherwise = n
--   where f = \n -> n + 1

  addOneIfOdd :: Integral a => a -> a
  addOneIfOdd n = case odd n of
    True -> f n
    False -> n
    where f = ( \n -> n + 1 )
