import Data.Char

type Bit = Int

bits2Int :: [Bit] -> Int 
bits2Int bits = sum [x * y | (x,y) <- zip weights bits] 
    where weights = iterate (* 2) 1

-- > bits2Int [1,0,1,1,0,0,0,0]
13

bitss2Int :: [Bit] -> Int 
bitss2Int = foldr (\x y -> x + 2 * y) 0

int2Bits :: Int -> [Bit]
int2Bits 0 = []
int2Bits n = mod n 2 : int2Bits (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)
