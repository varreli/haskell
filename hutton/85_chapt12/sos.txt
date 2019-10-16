prods xs ys = [x*y | x <- xs, y <- ys]

-- Using the fact that lists are applicative, we can 
-- now also give an applicative definition, which avoids
-- having to name the intermediate results:

prods' xs ys = pure (*) <*> xs <*> ys


