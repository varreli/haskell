addOneIfOdd :: Integral a => a -> a
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f = ( \n -> n + 1 )

-- http://lpaste.net/358015#a2384509402573963264 geekosaur
