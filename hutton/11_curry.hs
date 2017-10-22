mult :: Num a => a -> a -> a -> a
mult x y z = x * y * z

multt :: Num a => a -> a -> a -> a
multt y z = \x -> x * y * z         -- multt applies
                                    -- to x 
multt' :: Num a => a-> a -> a -> a
multt' z = \ x -> \ y -> x * y * z

multt'' :: Num a => a -> a -> a -> a
multt'' = \x -> \y -> \z -> x * y * z

