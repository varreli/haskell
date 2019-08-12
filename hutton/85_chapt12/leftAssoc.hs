-- fs <*> xs <*> ys is associated as (fs <*> xs) <*> ys

ff = pure (\x y z -> x * y ^ z) <*> [1,2] <*> [3,4] <*> [2,3]

-- associates to the left same as function application:

-- (pure (\x y z -> x * y ^ z) <*> [1,2]) <*> [3,4] <*> [2,3]


-- \x y z -> x * y ^ z           

-- is sugar for :                   

-- (\x -> (\y z -> x * y ^ z))   (x applied to the inner lambda)


-- so :
-- [\x y z -> x * y ^ z] <*> [1,2]     =

-- [(\y z -> 1 * y ^ z), (\y z -> 2 * y ^ z)]

-- since:
-- [f] <*> [a,b] = [f a, f b]

--------------------------------------------------------------------

-- λ > ff = pure (\x y z -> x * y ^ z) <*> [1,2] <*> [3,4] <*> [2,3]
-- [9,27,16,64,18,54,32,128]

-- full evaluation:

-- [(\y z -> 1 * y ^ z), (\y z -> 2 * y ^ z)]

-- [1] <*> [9,27,16,64]    -- (*) [1] 
-- [2] <*> [9,27,16,64]    -- (*) [2]     = 

-- [9,27,16,64] ++ [18,54,32,128]   
-- [9,27,16,64,18,54,32,128]
