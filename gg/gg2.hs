λ > let gg f a c = f a
Defined.

λ > gg not True "Oden"
False

-- it is also the same as (.) const:

λ > :t [(.) const, gg]
(a1 -> a) -> a1 -> b -> a]

λ > :t not
Bool -> Bool

λ > :t const
a -> b -> a

λ > :t flip const
flip const :: b -> c -> c

λ > :t const id
const id :: b -> c -> c

:t flip id
b -> (b -> c) -> c

id :: a -> a          -- including functions, so
a = (b -> c)
id :: (b -> c) -> (b -> c)

id :: (b -> c) -> b -> c    
-- rewritten since right associative.

-- this can be interpreted as a function taking 
-- 2 arguments. The first of type b -> c and the 
-- second, of type b.

-- So these 2 arguments can be flipped:

flip :: (a -> b -> c) -> (b -> a -> c)
id :: (b -> c) -> b -> c
flip id :: b -> (b -> c) -> c


λ > :t map
(a -> b) -> [a] -> [b]

λ > :t (+)
Num a => a -> a -> a

λ > :t map (+)
Num a => [a] -> [a -> a]
-- here, the "b" in map unifies with "a -> a"

λ > :t map (+) [1,2,3]
Num a => [a -> a]

----------------------------------------------

λ > zipWith id (map (+) [1,2,3]) [4,5,5]
[5,7,8]

-- you never write that computation in that 
-- way; it just highlights another "arity- 
-- breaking" unification.

Prelude> :t map
(a -> b) -> [a] -> [b]

Prelude> :t (+)
Num a => a -> a -> a

Prelude> :t map (+)
Num a => [a] -> [a -> a]

-- here, the "b" in map unifies with "a -> a"
