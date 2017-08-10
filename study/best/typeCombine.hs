-- These are combinations of the type Bool, 
-- and the *type class* Ord . Combinations
-- allow only one instance (here 'a') in 
-- scope : 

ff :: Ord a => a -> a -> Bool; ff = (<)
gg :: Ord a => a -> a -> Bool; gg = (>)
hh :: Ord a => a -> a -> Bool; hh = (==)

-- here 'a' instantiates both Eq and Ord
