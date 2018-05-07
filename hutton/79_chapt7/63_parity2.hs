import Data.Char


type Bit = Int

unfold p h t x
  | p x = []
  | otherwise = h x : unfold p h t (t x)
    
mapUnfold :: (a -> b) -> [a] -> [b]
mapUnfold f = unfold null (f . head) tail
    
iterateUnfold :: (a -> a) -> a -> [a]
iterateUnfold f = unfold (const False) id f

chop8 :: [Bit] -> [[Bit]]
chop8 = unfold null (take 8) (drop 8)

bin2int :: [Bit] -> Int
bin2int bits = sum [w * b | (w, b) <- zip weights bits]
                 where weights = iterateUnfold (*2) 1

int2bin :: Int -> [Bit]
int2bin = unfold (== 0) (`mod` 2) (`div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode :: String -> [Bit]
encode = concat . map (make8 . int2bin . ord)

decode :: [Bit] -> String
decode = map (chr . bin2int) . chop8

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id

encodeWithParity :: String -> [Bit]
encodeWithParity = concat . map (addParityBit . make8 . int2bin . ord)

decodeWithParity :: [Bit] -> String
decodeWithParity = map (chr . bin2int . checkParityBit) . chop9

chop9 :: [Bit] -> [[Bit]]
chop9 = unfold null (take 9) (drop 9)

addParityBit :: [Bit] -> [Bit]
addParityBit bits = (parity bits) : bits

parity :: [Bit] -> Bit
parity bits
  | odd (sum bits) = 1
  | otherwise = 0

checkParityBit :: [Bit] -> [Bit]
checkParityBit (b:bs)
  | b == parity bs = bs
  | otherwise = error "Wrong Parity Bit"

transmit' :: String -> String
transmit' = decodeWithParity . faultyChannel . encodeWithParity

faultyChannel :: [Bit] -> [Bit]
faultyChannel = tail

transmit'' :: String -> String
transmit'' = decodeWithParity . channel . encodeWithParity
