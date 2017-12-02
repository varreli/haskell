import Data.Char

type Bit = Int

bits2Int :: [Bit] -> Int 
bits2Int bits = sum [x * y | (x,y) <- zip weights bits] 
    where weights = iterate (* 2) 1


bitss2Int :: [Bit] -> Int 
bitss2Int = foldr (\x y -> x + 2 * y) 0
