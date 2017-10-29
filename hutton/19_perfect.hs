factors :: Int -> [Int]
factors n = [ x | x <- [1..n] , mod n x == 0 ]  

perfect :: Int -> [Int]
perfect nn = [ x | x <- [1..nn] , x == sum (init (factors x)) ]  



-- !!! perfect solved alone ; not factors
