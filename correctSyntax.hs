increment1 = (+ 1)
lenInc1 str = increment1 (length str)

heady (x:xs) = x
identity x = x 

furst (r,s) = r
furst2 (t,u) = fst o where o = (t,u) 
