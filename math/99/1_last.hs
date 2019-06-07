-- these return the last element of a list

llast :: [a] -> a
llast [] = error "No elements"
llast [x] = x
llast (_:xs) = llast xs

lastly list = print $ (head . reverse) list
