-- main = print $ zipWith (+) [2,3,4,5] [2,4..8]
-- [4,7,10,13]

main = print $ zipWith (*) (replicate 5 2) [1..] 
-- [2,4,6,8,10]

-- main = print $ zipWith (++) ["Hi ", "Eat "] 
--   ["Joe", "Pie"]
-- ["Hi Joe", "Eat Pie"]
