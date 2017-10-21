multt :: Num a => a -> a -> a -> a
multt y z = \x -> x * y * z         -- multt applies
                                    -- to x 

multt' :: Num a => a -> a -> a -> a
multt' = \x -> \y -> \z -> x * y * z

