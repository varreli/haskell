tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = div x 10
        d     = xLast `mod` 10





-- divMod just does div and mod at the same time and returns them tupled
