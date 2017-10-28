squareTo100 = sum [ x ^ 2 | x <- [1..100]]


grid :: Int -> Int -> [(Int,Int)]
grid m n = [ (x,y) | x <- [0..m], y <- [0..n]]        


-- this uses grid and excludes (0,0) and (n,n) :

squareNoDiagonal :: Int -> [(Int, Int)]
squareNoDiagonal n = [ (x,y) | (x,y) <- grid n n , x /= y]


-- same, solution from mud :

sqrND :: Int -> [(Int, Int)]
sqrND n = filter (uncurry (/=)) $ grid n n

-- λ > :t uncurry (/=)
-- uncurry (/=) :: Eq a => (a, a) -> Bool
-- note: uncurry (/=)  ==   \(x,y) -> x /= y 

repplicate :: Int -> a -> [a]
repplicate i elem = [ elem | _ <- [0..i]] -- like prelude length :            

llength :: [a] -> Int
llength xs = sum [1 | _ <- xs]
