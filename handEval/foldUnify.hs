-- in foldr, b is the type of the accumulator and a 
-- is the element type. So (a -> b -> b) says how
-- to combine an element into your accumulator:

λ > :t foldr
foldr :: Foldable t :: (a -> b -> b) -> b -> t a -> b

λ > :t (.)
(b -> c) -> (a -> b) -> a -> c

 λ > :t foldr (.)
foldr (.) :: Foldable t => (a -> b) -> t (b -> b) -> a -> b

-- We now have: 
a ~ b' -> c', b ~ a' -> b', and  b ~ a' -> c'

-- The last two imply that:
b' ~ c'

We ultimately get a ~ b' -> b' and b ~ a' -> b'  : 
foldr (.) :: (a' -> b') -> t (b' -> b') -> a' -> b'


 λ > :t foldr (.) id
foldr (.) id :: Foldable t => t (b -> b) -> b -> b

-- the unification generates a set of substitutions 
-- which we apply. 

Foldable t => t (b -> b) -> b -> b     -- This is a list in this case:
[b -> b] -> b -> b

-- note:

foldr g z [a,b,...,n] = g a (g b (... (g n z) ...))

-- id takes the role of `z` :

foldr (.) id [a,b,...,n] = a . b .  ...  . n . id

-- (a -> b) is like (a, b)

-- set (c, c) = (q, (r, s)) :


-- q -> r -> s
-- c ~ q
-- c ~ (r -> s)





