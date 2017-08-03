h (x:xs) = x + h (xs)
h ([]) = 0

-- λ > h (3:(5:[]))
-- 8

-- λ > h (3:(5:[10]))
-- 18

hick (x:xs) = x * hick (xs)
hick ([]) = 0

-- λ > hick (3:(5:[10]))
-- 0

--  The base case, [] = 0 , is always reached.
--  [10] is shorthand for 10 : []
--  i.e every finite list has a []

--  hick (1:2:[]) is 1 * (2 * 0)

--  hick is not building up a list. hick is
--  consuming a list and crunching numbers
--  (the list is xs here.)
