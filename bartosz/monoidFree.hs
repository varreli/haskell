-- Algebras as typeclasses:

-- free monoids:          e * a = a * e = a
--                        (a * b) * c = a * (b * c)
-- M :: (m, m) -> m

--     (0 + 3)  (1 + 2) = (2 + 1) = (0 + 3)
-- 3 =  (0,3)    (1,2)     (1,2)     (0,3)

-- in matrix multiplication, ab /= ba . 
-- ab = ba is symmetry, but not all monoids have symmetry.

-- multiplication (*) is just concatenation of all possible lists.
-- In the case of integers, the set is infinite.


-- The laws of an algebra guarantee predictable composition of 
-- programs. We must combine programs safely.


-- What are the morphisms for the set of monoids? They need to
-- understand the structure of monoids. A function that preserves
-- a certain structure is called a homomorphism. 
-- So a homomorphism 'h' will map the unit element of one monoid to
-- the unit element of another monoid : e1 -> h -> e2.

-- So we can derive knowledge about the category of monoids by
-- looking at the morphisms:

--                          a -> h(a)
--                          b -> h(b)
--                         ab -> h(a) -> h(b) -> h(ab)


-- (Note monoids can be defined in a variety of ways, ie F-algebras.)

-- So the identity function is a homomorphism, it maps monoid to
-- monoid, unit to unit, and product to product. Composition to
-- composition works. So it is a category: Monoid.

-- But we need a set to define a monoid. We use U the forgetful functor.

--                       U  =   Mon -> Set
--                            monoid category projected to down to earth
--                            set : monoid -> U(m)


-- if a monoid is a tuple like (m,e,+,law1,law2) 
-- then U (m,e,+,law1,law2) = m

-- it's obviously forgetting 4 things in the process
-- of mapping the objects
-- it's also forgetting aspects of the homomorphism
-- the fact that its a monoid homomorphism and not just a random 
-- function

-- U (f, proofId, proofMappend) = f
-- is more explicit.

