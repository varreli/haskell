-- find list of positions of x in the list xs :  

positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (elem, i) <- zip xs [0..], elem == x] 
