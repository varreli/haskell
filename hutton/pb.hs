squareNoDiagonal :: Int -> [(Int, Int)]
squareNoDiagonal n = [ (x,y) | (x,y) <- grid n n , x /= y]

-- alternative:

sqrND :: Int -> [(Int, Int)]
sqrND n = filter (uncurry (/=)) $ grid n n
