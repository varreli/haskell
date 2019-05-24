-- function that returns the third element:

third :: [a] -> a
third list = head . tail $ drop 1 list 

-- $ is needed here since (.) can only compose functions.
-- drop 1 list has all its parameters supplied. So its 
-- not a function, but a list.    
-- There is no -> in the type :


-- > :t drop 1 [1..10]
-- drop 1 [1..10] :: (Enum a, Num a) => [a]

-- > :t drop 1
-- drop 1 :: [a] -> [a]


-- note: tail . drop 1 == drop 2
thirrd :: [a] -> a
thirrd = head . tail . drop 1

thirdd :: [a] -> a
thirdd = head . drop 2   -- note both have eta reduction



-- list indexing:

getThird :: [a] -> a
getThird xs = xs !! 2     -- cannot eta reduce
                        
get_third :: [a] -> a
get_third = (!! 2)        -- eta reduce with a section.

getThirdd :: [a] -> a
getThirdd = flip (!!) 2   -- change order of arguments
                          -- to allow eta reduction

-- pattern match:

third_elem :: [a] -> a
third_elem (x:xa:xb:xs) = xb
