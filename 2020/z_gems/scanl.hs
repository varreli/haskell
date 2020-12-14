arithmetic = scanl (\acc y -> acc*2 + y) 4   
-- λ> arithmetic [3,4,5]
-- [4,11,26,57]
revverse :: [Char] -> [Char]
revverse = foldl (\acc x -> x:acc) ""
-- λ> scanl (\acc x -> x : acc) [] "klmn"
-- ["","k","lk","mlk","nmlk"]

maxOrMin = scanl (\acc x -> max acc x) 11

-- λ> maxOrMin [min 11 12, min 12 13, max 12 13]
-- [11,11,12,13]
