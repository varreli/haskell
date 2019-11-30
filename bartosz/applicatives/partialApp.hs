cc = (*) <$> [2,5,10] <*> [8,10,11] 
 
-- compare to list comprehension:
 
dd xs ys = [x * y | x <- xs, y <- ys]
---------------------------------------

actions :: IO String  
actions = (++) <$> getLine <*> getLine  

action = do  
     a <- (++) <$> getLine <*> getLine  
     putStrLn $ "The two lines concatenated turn out to be: " ++ a  


-- function application:

-- instance Applicative ((->) r) where  
--    pure x = (\_ -> x)  
--    f <*> g = \x -> f x (g x)


