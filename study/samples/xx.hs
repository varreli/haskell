-- xs is mererly bound, not evaluated:
Prelude> let x:x':xs = [1,2,undefined] in x' 
2

-- fibonacci using this pattern:
Prelude> let x = 1 : 1 : zipWith (+) x (tail x) in x

-- this is zipping a list with the tail of that 
-- list using addition 
--
-- [ Note: Anything that works with infinite lists must 
-- be co-recursive. ]

-- Prelude> zipWith (+) [1..5] [10..15]
-- [11,13,15,17,19] 
