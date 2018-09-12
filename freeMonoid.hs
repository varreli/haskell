-- free monoids:          e * a = a * e = a
--                        (a * b) * c = a * (b * c)
M :: (m, m) -> m

       (0 + 3)  (1 + 2) = (2 + 1) = (0 + 3)
-- 3 =  (0,3)    (1,2)     (1,2)     (0,3)

-- in matrix multiplication, ab /= ba . 
-- ab = ba is symmetry, but not all monoids have symmetry.

-- multiplication (*) is just concatenation of all possible lists.
-- In the case of integers, the set is infinite.

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


-- (Also, monoids can be defined with F-algebras.)

-- So the identity function is a homomorphism, it maps monoid to
-- monoid, unit to unit, and product to product. Composition to
-- composition works. So it is a category: Monoid.

-- But we need a set to define a monoid. We use U the forgetful functor.

--                       U  =   Mon -> Set
--                            monoid category projected to down to earth
--                            set : monoid -> U(m)



