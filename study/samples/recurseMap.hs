-- recursion can be the function itself, 
-- as in our own map function :

map' _ []     = []
map' f (x:xs) = f x : map' f xs

main = print $ map' sum [[0,1], [3,4], [1,5]]


-- @src map -- xchat command  
