-- zipWith (+) [2,3,4,5] [2,4..8]
-- [4,7,10,13]
--
-- zipWith (*) (replicate 5 2) [1..] 
-- [2,4,6,8,10]
--
-- zipWith (++) ["Hi ", "Eat "] 
-- ["Joe", "Pie"]
-- ["Hi Joe", "Eat Pie"]
--


-- [x^2 | x <- [0 .. 9]]
-- comprehension with only one generator ( <- .. )


-- using ParallelListComp extension :

{-# LANGUAGE ParallelListComp #-}
main = print $ [x + y | x <- [100,200] | y <- [3,4,5]]  



-- zipCart f as bs = [f a b | a <- as, b <- bs]

-- all combinations are tried :

-- zipCart (+) [100,200] [3,4,5] 

-- zipCart id [sin, cos, tan] [pi/2, 3*pi/4, 1]
