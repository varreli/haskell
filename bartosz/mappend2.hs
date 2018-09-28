import Data.Monoid
import Safe (readMay)


-- main = print numbers

numbers :: Maybe [Int]
numbers = readMay "[1,2,3]" <> readMay "[90" <> readMay "[4,5,6]" <> mempty 

vals :: [Maybe Int]
vals = [readMay "ignored", readMay "1", readMay "5"]

values :: [Maybe String]
values = [readMay "\"balloon\"", readMay "1", readMay "5"]

aa = print . mconcat $ map First vals
bb = print . mconcat $ map Last  vals

cc = print . mconcat $ map First values
