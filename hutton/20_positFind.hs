-- find indices list of x in the list xs :  

positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (elem, i) <- zip xs [0..], elem == x] 



-- find value of a key:

find :: Eq a => a -> [(a, b)] -> [b]
find key tup = [ v | (k, v) <- tup, k == key]



-- use same type as positions with find:

findPositOf :: Eq a => a -> [a] -> [Int]
findPositOf val xs = find val (zip xs [0..]) 


-- this won't take a tuple of various types 
-- without a more elaborate type  -  i.e. (1, "boo")
