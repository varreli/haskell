-- seriesUp :: Int -> [Int]
-- seriesUp n = seriesUp' 0 n
--  
-- seriesUp' :: Int -> Int -> [Int]
-- seriesUp' i n | i > n     = []
--               | otherwise = [1..i] ++ seriesUp' (i + 1) n



-- improved:

seriesUp :: Int -> [Int]
seriesUp = seriesUp' 0
    where 
    seriesUp' i n | i <= n     = [1..i] ++ seriesUp' (i + 1) n 
                  | otherwise  = []


-- non-recursive:

f = concatMap rr . rr 
    where rr n = [1..n ] 

-- note: f n = concatMap rr . rr n



-- Prelude> let rr n = [1..n]

-- Prelude> rr 5
-- [1,2,3,4,5]
--
-- Prelude> map rr (rr 5)
-- [[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]]

-- Prelude> concat (map rr (rr 5))
-- [1,1,2,1,2,3,1,2,3,4,1,2,3,4,5]
