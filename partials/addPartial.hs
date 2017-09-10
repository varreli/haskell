addStuff :: Integer -> (Integer -> Integer)

addStuff = \a -> \b -> a + (b + 5)
                                 
-- addStuff = \a b -> a + (b + 5)   -- variations
-- addStuff a b = a + b + 5

-- λ > let addTen = addStuff 5
-- λ > let fifteen = addTen 5
-- λ > fifteen
-- 15

-- λ > let addTwelve x = addStuff x 7


