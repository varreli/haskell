import StateCaleMod2 


increment = get >>= \n -> put (n+1)   
                                     
pure' = get >>= \n -> return (n+5) 
                                   

-- ghci> runState pure' 3 == runState (fmap (+5) get) 3
-- True


-- the functor definition only applies to the 'a' type of 'State s a'
-- so no functor methods can directly access the 's' type.
-- the pure' equivalence emerges because 'return' is equivalent 
-- to 'pure' and 'fmap' is really:

-- ' ap . pure ' 
