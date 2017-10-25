import Data.Char

let2int :: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c 
  | isLower c = int2let (mod (let2int c + n) 26)
  | otherwise = c

encode :: Int -> [Char] -> [Char]
encode n xs = [shift n x | x <- xs]



percent :: Int -> Int -> Float
percent m n = (fromIntegral m / fromIntegral n) * 100

lowers :: [Char] -> Int
lowers xs = length [ x | x <- xs , x >= 'a' && x <= 'z']

count :: Char -> [Char] -> Int
count char xs = length [ x | x <- xs , x == char]

freqs :: [Char] -> [Float]
freqs xs = [ percent (count x xs) n | x <- ['a'..'z'] ]
  where n = lowers xs
