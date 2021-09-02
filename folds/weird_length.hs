-- comprehensions cannot fold. They can map, 
-- concat, and filter. See MonadPlus. 

-- weird example:

length' = sum [ 1 | _ <- [1,2,3] ]


-- STUDY:
-- λ> xx = [ 1 | _ <- (replicate 3 "t") ]
-- λ> xx
-- [1,1,1]

-- this is the same as

rep = replicate 3 1

