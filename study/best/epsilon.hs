numbers xs = [x | x <- xs , even x]
--
-- Set Comprehensions build more specific
-- sets out of general sets.
-- This is a list comprehension where the
-- notation resembles set builder notation.
-- The token '<-' corresponds to a stylized
-- lowercase Greek epsilon, standard notation
-- for set membership.

-- Read '<-' as "drawn from" :

-- [x | x <- xs , even x]

-- "the list of all x such that x is drawn
-- from xs and x is even."  ','  corresponds to
-- 'and' . 'and' is used to add conditions
-- beyond mere membership in the list being
-- drawn from. Study conditions here :

set = [ y * 2 | y <- [1..10], y * 2 >= 14]
--  >> [14,16,18,20]
set' = [ y * 2 | y <- [1..10], y >= 14 ]
--  >> []
set'' = [ y * 2 | y <- [1..14], y >= 14 ]
--  >> [28]

listTimes3 = [ x * 3 | x <- [1..10], x * 3 <= 50]
-- >> [3,6,9,12,15,18,21,24,27,30]
listTimes3' = [ x * 3 | x <- [1..10], x <= 33]
-- >> [3,6,9,12,15,18,21,24,27,30]
listTimes3'' = [x * 3 | x <- [1..16], x  <= 50]
-- >> [3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48]
