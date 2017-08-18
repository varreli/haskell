-- To get the cartesian product of the lists 
-- xs and ys, we just need to take the tuple 
-- (x,y) for each element x in xs and each 
-- element y in ys. Use a list comprehension:

cartProd xs ys = [(x,y) | x <- xs, y <- ys]


-- -- -- ------------------------------------

-- import Control.Monad (liftM2)

-- cartProd :: [a] -> [b] -> [(a, b)]
-- cartProd = liftM2 (,)

-- You probably wouldn't ever want to 
-- write this in real code, but the basic 
-- idea is something you'll see in Haskell 
-- all the time: we're using liftM2 to lift 
-- the non-monadic function (,) into a monad;
-- in this case specifically the list monad.
