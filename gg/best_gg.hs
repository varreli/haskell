id :: c -> c

const :: a -> b -> a

const id :: (c -> c) -> b -> (c -> c) -- unified

> const id 2 "goo" -- const applied to id is:    b -> (c -> c)
                   -- id "goo"
                   -- "goo"

> const const id 5 "goofy" -- const applied to const id is
                           -- const 5 "goofy"
			   -- 5


-- :t const const id is :: a -> b -> a 
-- :t const const const id :: b -> a -> a, and so on
