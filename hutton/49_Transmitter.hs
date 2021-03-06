import Data.Char

type Bit = Int

bits2Int :: [Bit] -> Int 
bits2Int bits = sum [x * y | (x,y) <- zip weights bits] 
    where weights = iterate (* 2) 1

-- > bits2Int [1,0,1,1,0,0,0,0]
-- 13

bitss2Int :: [Bit] -> Int 
bitss2Int = foldr (\x y -> x + 2 * y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = mod n 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode :: String -> [Bit]
encode = concat . map (make8 . int2bin . ord)

chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits) 

-- chop8 (drop 8 bits) sets up a new patt match

decode :: [Bit] -> String
decode = map (chr . bitss2Int) . chop8

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id 

transmmit :: String -> String
transmmit = decode . id . encode
