fibs = 1 : scanl (+) 1 fibs
 
main = print $ take 7 fibs