addStuff :: Integer -> Integer -> Integer

addStuff a b = a + b + 5

-- here with explicit right associative () :
-- addStuff :: Integer -> (Integer -> Integer)
--

-- λ > let addTen = addStuff 5
-- λ > let fifteen = addTen 5
-- λ > fifteen
-- 15

