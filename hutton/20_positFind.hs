-- find list of positions of x in the list xs :  

positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (elem, i) <- zip xs [0..], elem == x] 



find :: Eq a => a -> [(a, b)] -> [b]
find key tup = [ v | (k, v) <- tup, k == key] -- find value

-- use same type as positions with find:

findPositOf :: Eq a => a -> [a] -> [Int]
findPositOf elem xs = find elem (zip xs [0..]) 
