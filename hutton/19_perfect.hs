factors :: Int -> [Int]
factors n = [ x | x <- [1..n] , mod n x == 0 ]  

perfect :: Int -> [Int]
perfect nn = [ x | x <- [1..nn] , x == sum (init (factors x)) ]  


-- !!! perfect I solved alone ; not factors



twoGens = [ (x,y) | x <- [1,2], y <- [3,4]]

oneGen  =  concat [[ (x,y) | x <- [1,2]] | y <- [3,4]]
oneGenn =  concat [[ (x,y) | y <- [3,4]] | x <- [1,2]]
