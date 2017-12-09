import Data.List

votes :: [String]
votes = ["Pete","John","John","John","Pete","Ralph"]

counter :: Eq a => a -> [a] -> Int
counter x = length . filter (== x)

rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : filter (/= x) (rmdups xs)

result :: Ord a => [a] -> [(Int, a)]
result vs = sort [ (counter v vs, v) | v <- rmdups vs ]

winner :: Ord a => [a] -> a
winner = snd . last . result
