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

table :: [Float]
table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0, 0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0, 6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

percent :: Int -> Int -> Float
percent m n = (fromIntegral m / fromIntegral n) * 100

lowers :: [Char] -> Int
lowers xs = length [ x | x <- xs , x >= 'a' && x <= 'z']

count :: Char -> [Char] -> Int
count char xs = length [ x | x <- xs , x == char]

freqs :: [Char] -> [Float]
freqs xs = [ percent (count x xs) n | x <- ['a'..'z'] ]
  where n = lowers xs

rotate :: Int -> [Int] -> [Int]
rotate x xs = drop x xs ++ take x xs

chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o - e)^2)/e | (o,e) <- zip os es]

