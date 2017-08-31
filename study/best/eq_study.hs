-- ff is written specific to String here :

ff :: [Char] -> [Char] -> Bool 
ff a b = (==) a b

main :: IO ()
main = print (ff "Fish" "Rock")


-- ff is a function that is called on a b. 
-- Adding a where clause is effectively 
-- changing the variable names to s t  :

-- ff :: [Char] -> [Char] -> Bool 
-- ff s t = (==) a b
--   where
--     a = "Fish"
--     b = "Rock"
--
-- main :: IO ()
-- main = print ff

-- This is wrong
