import Data.List

oo = map (\x -> (length x, head x)) $ group $ sort [1,3,5,7,5,7,3,5,5,1]
