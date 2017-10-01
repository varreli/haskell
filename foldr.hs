-- foldr, applied to a binary operator, a starting
-- value (typically the right-identity of the 
-- operator), and a list, reduces the list using 
-- the binary operator, from right to left.

-- > foldr (:) [5,6,7] [1,2,3,4]
-- [1,2,3,4,5,6,7]  
-- ( evaluates to 1 : 2 : 3 : 4 : [5,6,7] )

-- Prelude > foldr (\x y -> x + y / 2) 54 [12, 4, 10, 6]
-- 12.0


foldr :: (a -> b -> b) -> b -> [a] -> b

foldr _ z []     =  z
foldr f z (x:xs) =  f x (foldr f z xs)


(*) -- has both right and left identity: (1*) (*1)
(+) -- has both right and left identity: (y+) (+y)

(-) -- has only right identity
(/) -- has only right identity: /1

(^) -- has only right identity

(:) -- takes two arguments not of the same type.


-- λ > foldr (/) 64 [4,2,4] 
-- 0.125

-- λ > foldr (-) 54 [10,11] 
-- 53
--
--  λ > foldr (*) 10 [2,3,4]
--  240


--  λ > scanr (*) 10 [2,3,4]
--  [240,120,40,10]


-- λ > head (scanr (*) 10 [2,3,4]) == foldr (*) 10 [2,3,4]
-- True



-- http://www.cantab.net/users/antoni.diller/haskell/units/unit06.html
