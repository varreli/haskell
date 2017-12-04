-- study - do - these unifications:

> :t id
a -> a

> :t flip id
b -> (b -> c) -> c

> :t const id
b -> a -> a

> :t const const
b1 -> a -> b2 -> a

> :t const . const
a -> b1 -> b2 -> a
