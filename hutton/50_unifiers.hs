-- study - do - these unifications:

> :t id
a -> a


> :t flip id
b -> (b -> c) -> c

-- id is gone after you apply flip to it:

-- > flip id 4 (/) 3
-- > flip 4 (/) 3
-- > (/) 4 3
-- 1.33333


> :t const id
b -> a -> a

> :t const const
b1 -> a -> b2 -> a

> :t const . const
a -> b1 -> b2 -> a
