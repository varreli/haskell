numbers xs = [x | x <− xs , even x] 

-- This is a list comprehension where the 
-- notation is designed to be similar to 
-- set builder notation with the token '<-'        
-- corresponding to the stylized lower case 
-- Greek epsilon, the standard symbol 
-- for set membership. Read '<-' as "drawn 
-- from" :

[x | x <− xs , even x] 

-- "the list of all x such that x is drawn 
-- from xs and x is even."  ','  corresponds to 
-- 'and' . 'and' is used to add conditions 
-- beyond mere membership in the list which is.  --being drawn from.
