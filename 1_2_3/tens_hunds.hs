tensDigit :: Integral a => a -> a
tensDigit x = tens 

  where xLast  = div x 10
        tens   = xLast `mod` 10


tensDigit2 :: Integral a => a -> a 
tensDigit2 x = tenns
    
  where xLast   = fst $ divMod x 10
        tenns   = snd $ divMod xLast 10



hunsDigit :: Integral a => a -> a 
hunsDigit x = huns
    
  where xLast   = fst $ divMod x 100
        huns    = snd $ divMod xLast 10


-- divMod just does div and mod at the same time and returns them tupled
