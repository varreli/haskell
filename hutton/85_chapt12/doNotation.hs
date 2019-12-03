-- Compare:

kk = [(x,y) | x <- [1,2,3], y <- [1,2,3], (x /= y)]

----------------------------------------------------

ll = do x <- [1,2,3]
        y <- [1,2,3]
        True <- return (x /= y)
        return (x,y)



mm = do x <- [1,2,3]
        y <- [1,2,3]
        True <- ([x /= y] :: [Bool])
        return (x,y)

----------------------------------------------------

nn = [1,2,3] >>= (\x -> [1,2,3] >>= (\y -> return (x /= y) >>= 
        (\r -> case r of True -> return (x,y)
                         _    -> fail "")))

-- (Substituting <&> or (flip fmap) for >>=   
-- has so far failed)

----------------------------------------------------
oo = concatMap (\x -> [x,x]) [1,2,3]


-- For lists,  xs >>= f = concatMap f xs  :
-- bind is literally concatMap.
-- replace bind with fmap (concatMap with map) to see the 
-- tree that eventually gets collapsed.
-- We get a large nested list of lists 

-- [[[(Int, Int)]]]

-- and their full concatenation is the final result

----------------------------------------------------

-- Q: Considering evaluation steps, what would [1,2,3] 
-- look like after it was bound to (\x -> [1,2,3] ...) ?

-- A: Binding happens at the top level, so it just 
-- looks like the end result.
