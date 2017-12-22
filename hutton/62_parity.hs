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

parify :: [Int] -> [Int]
parify [] = []
parify xs   | even (sum xs) = xs ++ [0]
            | otherwise     = xs ++ [1]

unparify :: [Int] -> [Int]
unparify [] = []
unparify xs | even (sum (init xs)) && (last xs == 0) = init xs
            | odd (sum (init xs)) && (last xs == 1)  = init xs
            | otherwise = error "Parity error!"

--------------------------------------------------


parity :: [Bit] -> Bit
parity xs = if even (sum xs) then 0 else 1


addParityBit :: [Bit] -> [Bit]
addParityBit bs = parity bs : bs

encode2 :: String -> [Bit]
encode2 = concat . map ( addParityBit . make8 . int2bin . ord )

hasValidParity :: [Bit] -> Bool
hasValidParity bs = parity (drop 1 bs) == head bs 


decode2 :: [Bit] -> String
decode2 [] = [] 
decode2 xs = case (hasValidParity encodedByte) of
               True ->  chr (bitss2Int (tail encodedByte))  : decode2 (drop 9 xs)
               False -> error "Parity error"
             where encodedByte = take 9 xs 
