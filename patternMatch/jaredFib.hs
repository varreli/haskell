-- fibonacci using this pattern:

Prelude> let x = 1 : 1 : zipWith (+) x (tail x) in x

-- this is zipping a list with the tail of that 
-- list using addition 

-- Prelude> zipWith (+) [1..5] [10..15]
-- [11,13,15,17,19] 


-- Note: Anything that works with infinite lists, 
-- such as fibonaccis, must be co-recursive.
