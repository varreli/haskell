zz = [(a,b,c) | a <- [1..3], b <- [1..3], c <- [1..3]]

-- ghci> zz
-- [(1,1,1),(1,1,2),(1,1,3),(1,2,1),(1,2,2),(1,2,3),(1,3,1),(1,3,2),
-- (1,3,3),(2,1,1),(2,1,2),(2,1,3),(2,2,1),(2,2,2),(2,2,3),(2,3,1),
-- (2,3,2),(2,3,3),(3,1,1),(3,1,2),(3,1,3),(3,2,1),(3,2,2),(3,2,3),
-- (3,3,1),(3,3,2),(3,3,3)] 

xx = [(a,z) | a <- [1..3], b <- [1..3], c <- [1..3], let z = min a b, z < c]
