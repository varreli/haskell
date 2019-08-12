-- fs <*> xs <*> ys is associated as (fs <*> xs) <*> ys

ff = pure (\x y z -> x * y ^ z) <*> [1,2] <*> [5,7] <*> [2,3]

-- λ > ff = pure (\x y z -> x * y ^ z) <*> [1,2] <*> [5,7] <*> [2,3]
-- [25,125,49,343,50,250,98,686]


-- λ > ff = pure (\x y z -> x * y ^ z) <*> [1,2] <*> [3,4] <*> [2,3]
-- [9,27,16,64,18,54,32,128]



-- associates to the left same as function application:

-- (pure (\x y z -> x * y ^ z) <*> [1,2]) <*> [3,4] <*> [2,3]



-- \x y z -> x * y ^ z           

-- is sugar for :                   

-- (\x -> (\y z -> x * y ^ z))   (x applied to the inner lambda)



-- so :
-- [\x y z -> x * y ^ z] <*> [1,2]

-- which is :

-- [(\y z -> 1 * y ^ z), (\y z -> 2 * y ^ z)



-- since:

-- [f] <*> [a,b] = [f a, f b]
