-- Compare:

kk = [(x,y) | x <- [1,2,3], y <- [1,2,3], (x /= y)]


ll = do x <- [1,2,3]
        y <- [1,2,3]
        True <- return (x /= y)
        return (x,y)


mm = do x <- [1,2,3]
        y <- [1,2,3]
        True <- ([x /= y] :: [Bool])
        return (x,y)

-- Q: How do we chart the evaluation steps of nn ? :


nn = [1,2,3] >>= (\x -> [1,2,3] >>= (\y -> return (x /= y) >>= 
        (\r -> case r of True -> return (x,y)
                         _    -> fail "")))


-- A: An irc member made the following suggestions, in
--    this order:

-- 1. Binding happens at the top level, so it just 
--    looks like the end result.

-- 2. We can substitute <&> or (flip fmap) for >>=   

-- 3. We can employ oo below to chart evaluation steps:

oo = concatMap (\x -> [x,x]) [1,2,3]

-- 4. For lists,  xs >>= f = concatMap f xs ; bind is 
-- literally concatMap.

-- 5. Replace bind with fmap (concatMap with map) to see the 
-- tree that eventually gets collapsed.
-- We get a large nested list of lists 

-- [[[(Int, Int)]]]

-- and their full concatenation is the final result


