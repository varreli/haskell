-- > foldr (:) [5,6,7] [1,2,3,4]
-- [1,2,3,4,5,6,7]  
-- ( evaluates to 1 : 2 : 3 : 4 : [5,6,7] )

Prelude > foldr (\x y -> x + y / 2) 54 [12, 4, 10, 6]
-- 20.625 


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
