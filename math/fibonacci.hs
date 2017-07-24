fibs = 1 : scanl (+) 1 fibs
 
main = print $ take 13 fibs
