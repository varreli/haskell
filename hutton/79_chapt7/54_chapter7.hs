ff :: [a] -> (a -> Bool) -> (a -> b) -> [b]
ff xs p f = map f (filter p xs)

---------------------------------------------------
all_1 :: (a -> Bool) -> [a] -> Bool
all_1 _ [] = True
all_1 p (x:xs) = p x && all_1 p xs

-- x is not visible outside of the definition but is
-- bound to a value and introduced as an argument to
-- the function in the predicate, for example \n :

-- λ > all_1 (\n -> mod n 3 == 0) [3,6,9,12,15]

all_2 :: (Int -> Bool) -> [Int] -> Bool
all_2 p = foldr (\x y -> p x && y) True


all_3 :: (a -> Bool) -> [a] -> Bool
all_3 p = and . map p 



anny :: (a -> Bool) -> [a] -> Bool
anny p [] = False 
anny p (x:xs) = p x || anny p xs 


anny_2 :: (Int -> Bool) -> [Int] -> Bool
anny_2 p = foldr (\x y -> p x || y) False


any_3 :: (a -> Bool) -> [a] -> Bool
any_3 p = or . map p
---------------------------------------------------
