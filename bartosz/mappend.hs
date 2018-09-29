import Data.Monoid
import Safe (readMay)


numbers :: Maybe [Int]
numbers = readMay "[1,2,3]" <> readMay "[90" <> readMay "[4,5,6]" <> mempty 
--

vals :: [Maybe Int]
vals = [readMay "ignored", readMay "1", readMay "5"]

aa = print . mconcat $ map First vals
bb = print . mconcat $ map Last  vals

--

values :: [Maybe String]
values = [readMay "\"balloon\"", readMay "1", readMay "5"]

cc = print . mconcat $ map First values

--

valls :: [Int]
valls = [3,7,11]

dd = print . mconcat $ map Sum valls
ee = print . mconcat $ map Product valls

--

vallues :: [Bool]
vallues = [False,False,True]

ff = print . mconcat $ map All vallues
gg = print . mconcat $ map Any vallues

--


