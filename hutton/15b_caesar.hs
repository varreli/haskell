import Data.Char

let2cases :: Char -> Int
let2cases c = ord c - ord 'A'

int2let :: Int -> Char
int2let n = chr (ord 'A' + n)


-- shift a character c by n slots to the right:
shift :: Int -> Char -> Char
shift n c 
  | isLower c || isUpper c || c == '[' || c == ']' || c == '^' || c == '_' || c == '`' = int2let (mod (let2cases c + n) 58)
  | otherwise = c


-- top-level string encoding function:
encode :: Int -> [Char] -> [Char]
encode n xs = [shift n x | x <- xs]


-- table of frequencies of English alphabet:
table :: [Float]
table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0, 0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0, 6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]


percent :: Int -> Int -> Float
percent m n = (fromIntegral m / fromIntegral n) * 100

lowers :: [Char] -> Int
lowers xs = length [ x | x <- xs , x >= 'a' && x <= 'z']

count :: Char -> [Char] -> Int
count char xs = length [ x | x <- xs , x == char]


-- compute frequencies of letters in a given string:
freqs :: [Char] -> [Float]
freqs xs = [ percent (count x xs) n | x <- ['a'..'z'] ]
  where n = lowers xs


-- chi-square function for computing distance 
-- between 2 frequency lists:
chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o - e)^2)/e | (o,e) <- zip os es]


-- find list of positions of x in the list xs :  
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (elem, i) <- zip xs [0..], elem == x] 


--rotate a list by n slots to the left:
rotate :: Int -> [a] -> [a]
rotate x xs = drop x xs ++ take x xs


-- top-level decoding function:
crack :: String -> String
crack xs = encode (- factor) xs 
  where factor = head (positions (minimum chitab) chitab) 
        chitab = [chisqr (rotate n tableau) table | n <- [0..25]]
        tableau = freqs xs
