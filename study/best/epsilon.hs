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
-- drawn from.

set = [ y * 2 | y <- [1..10], y * 2 >= 14]
