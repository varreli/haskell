import Data.Monoid
import Safe (readMay)

-- main = print numbers

numbers :: Maybe [Int]
numbers = readMay "[1,2,3]" <> readMay "[90" <> readMay "[4,5,6]" <> mempty

vals :: [Maybe Int]
vals = [readMay "ignored", readMay "1", readMay "5"]

main =
--  print . mconcat $ map First vals
  print . mconcat $ map Last  vals
