gg = take 20 (scanl (+) 0 [1/fromIntegral (2^n) | n <- [0..]]) 

