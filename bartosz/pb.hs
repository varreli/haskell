import Data.Monoid
import Safe (readMay)

vals :: [Maybe Int]
vals = [readMay "ignored", readMay "1", readMay "5"]

values :: [Maybe String]
values = [readMay "1", readMay "\"balloon\"", readMay 5]

aa = print . mconcat $ map First vals
bb = print . mconcat $ map Last  vals

cc = print . mconcat $ map First values

-- iceland_Jack: when we run cc , the String "balloon" is
-- not read, but in aa and bb "1" and "5" 
-- (which I would hope are String elements) are read.
-- This is strange.
