import Data.List

votes :: [String]
votes = ["Pete","John","John","John","Pete","Ralph"]

rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : filter (/= x) (rmdups xs)

counter :: Eq a => a -> [a] -> Int
counter x = length . filter (== x)

result :: Ord a => [a] -> [(Int, a)]
result vs = sort [ (counter v vs, v) | v <- rmdups vs ]

winner :: Ord a => [a] -> a
winner = snd . last . result


-- example 2: 


ballots :: [[String]]
ballots = [ ["Pete","John"], ["John", "Ralph", "Pete"], ["John", "Pete"], [], ["John"] ]

rmEmpty :: Eq a => [[a]] -> [[a]]
rmEmpty = filter (/= [])

elim :: Eq a => a -> [[a]] -> [[a]]
elim x = map (filter (/= x))

rank :: Ord a => [[a]] -> [a]
rank = map snd . result . map head

winner' :: Ord a => [[a]] -> a
winner' bs = case rank (rmEmpty bs) of
  [c] -> c
  (c:cs) -> winner' (elim c bs)

-- [c] is a one element list, the winner, and
-- returns the winner.

-- note difference between refutable and 
-- irrefutable:

-- f _ [] = ..    -- the wildcard is irrefutable.
                  -- it wont fail.

-- f x [] = ..   x creates a binding to a value.
-- f _ [] = ..   _ does not create a binding.


