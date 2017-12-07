> :t const
a -> b -> a    -- or:

a -> (b -> a)

> :t id
c -> c


> :t const  -- id
(c -> c) -> b -> (c -> c)

-- becomes:
> :t const id
b -> (c -> c)





> :t const const
b1 -> a -> b2 -> a

> :t const . const
a -> b1 -> b2 -> a





-- id = ap const const.

-- And, of course, ap and const are the only two functions you need to compute anything. ( ap is from the reader monad.)
