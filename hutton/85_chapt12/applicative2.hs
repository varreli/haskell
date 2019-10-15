prods :: [Int] -> [Int] -> [Int]
prods xs ys = [x*y | x <- xs, y <- ys]   -- list comprehension
                                         -- product

-- Using the fact that lists are applicative, we can 
-- now also give an applicative definition, and apply
-- pure functions to multi-valued arguments. This avoids
-- having to name the intermediate results 
-- x and y  :


products :: [Int] -> [Int] -> [Int]
products xs ys = pure (*) <*> xs <*> ys  -- applicative product 

-- Think of "executing a list action" as "selecting an element 
-- from the list", which is what `x <- xs' and `y <- ys' do. 

