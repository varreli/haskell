-- list comprehensions are a concise way of creating a 
-- sequence of values based on some rules and lists of 
-- input values. comprehensions cannot fold. They can map, 
-- concat, and filter. See MonadPlus. 

-- weird example:

length' = sum [ 1 | _ <- [1,2,3] ]

-- this is the same as

rep = replicate 3 1

