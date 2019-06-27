composer :: (b -> c) -> (a -> b) -> a -> c
composer f g = (\x -> f (g x))


myAdd :: Int -> (Int -> Int) -- myAdd 4 returns function (Int -> Int) :

myAdd x = \y -> x + y  


-- Right associativity of -> in the type expression is not 
-- a right-to-left ordering of computation in the function 
-- evaluation. Function evaluation is *left* associative:

--  myAdd 2 10    IS THE SAME AS: 
-- (myAdd 2) 10
