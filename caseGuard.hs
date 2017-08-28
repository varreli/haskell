addOneIfOdd :: Integral a => a -> a
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f = ( \n -> n + 1 )

alwaysEven :: Integral a => a -> a
alwaysEven x
  | odd x = f x
  | otherwise = x
  where f = \x -> x + 1
