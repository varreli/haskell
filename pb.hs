-- adder :: Num a => a -> a 
-- adder = ( \x -> x + 5 )

addOneIfOdd :: Integral a => a -> a 
addOneIfOdd p = case odd p of
  True -> f p
  False -> p
  where f = ( \p -> p + 1 )

--adderOne2Odd :: Integral a => a -> a
--adderOne2Odd p = ( \p -> p + 1 )
--  case odd p
--          | True adderOne2Odd p
--          | False p
