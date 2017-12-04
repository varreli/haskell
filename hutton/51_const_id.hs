> :t const id
b -> a -> a

> :t const const
b1 -> a -> b2 -> a

> :t const . const
a -> b1 -> b2 -> a





paste to 50_flip_id :


-- id is gone after you apply flip to it:

-- > flip id 4 (/) 3
-- > flip 4 (/) 3
-- > (/) 4 3
-- 1.33333
