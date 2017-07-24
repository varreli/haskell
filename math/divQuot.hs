quotrem x y = ((quot x y) * y) + (rem x y)
divmod x y = ((div x y) * y) + (mod x y) 

main = do 
  print (quotrem 10 (-4))
  print (divmod 10 (-4))
