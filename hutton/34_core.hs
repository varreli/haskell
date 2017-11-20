-- take n elements from the start of a list:

taker :: Int -> [a] -> [a]
taker 0 _ = []
taker _ []  = []
taker n (x:xs) = x : taker (n - 1) xs


-- Taker returns a separate list from the input list.
-- In a context that wants a list, _ matches any 
-- single list (line 6).  [_] is for a list of lists. 

-- In taker 2 [1,2,3]  ,  [1,2,3] is immutable: [1,2]
-- returned is a separate return value.
