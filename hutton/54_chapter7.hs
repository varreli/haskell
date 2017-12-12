ff :: [a] -> (a -> Bool) -> (a -> b) -> [b]
ff xs p f = map f (filter p xs)

---------------------------------------------------
all_1 :: (a -> Bool) -> [a] -> Bool
all_1 _ [] = True
all_1 p (x:xs) = p x && all_1 p xs

all_2 :: (Int -> Bool) -> [Int] -> Bool
all_2 p = foldr (\x y -> p x && y) True

-- x is a parameter name…  you use it in the 
-- definition to refer to the parameter. Its 
-- name is not visible outside of the definition


-- x must be introduced first in the predicate: \x :

-- λ > all_1 (\x -> mod x 3 == 0) [3,6,9,12,15]


anny :: (a -> Bool) -> [a] -> Bool
anny p [] = False 
anny p (x:xs) = p x || anny p xs 

anny_2 :: (Int -> Bool) -> [Int] -> Bool
anny_2 p = foldr (\x y -> p x || y) False

---------------------------------------------------
