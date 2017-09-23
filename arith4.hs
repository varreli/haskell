module Arith4 where

-- id :: a -> a
-- id x 13G= x

-- roundTrip :: (Show a, Read a) => a -> a
-- roundTrip a = read (show a)
-- 
-- main = do
--   print (roundTrip 4)
--   print (id 4)

roundTripp :: (Show a, Read b) => a -> b
roundTripp = read . show

main = do
  print ((roundTripp 4) :: Int)
  print (id 4)

