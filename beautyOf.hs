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



f = concatMap r . r 
  where r n = [1..n]
