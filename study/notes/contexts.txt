let jackel :: (Eq a, Ord b) => a -> b -> a; jackel = undefined
λ > :t jackel True [1,2,3,4]
jackel True [1,2,3,4] :: Bool

λ > :t jackel True
jackel True :: Ord b => b -> Bool

λ > :t jackel [1,2,3,4]
jackel [1,2,3,4] :: (Eq t, Num t, Ord b) => b -> [t]

-- on line 9 :
-- Everything before a => in a type signature 
-- is not a parameter. The type signature could 
-- describe more than one feature of the argument. 
-- Numeric literals are polymorphic so a Num 
-- context is returned for them. What is returned 
-- will differ in various calls, since the 
-- signature is determined by the input types.

let kessel :: (Ord a, Num b) => a -> b -> a; kessel = undefined
λ > :t kessel 1 2
kessel 1 2 :: (Ord a, Num a) => a

λ > :t kessel 1.0 2
kessel 1.0 2 :: (Ord a, Fractional a) => a

λ > :t kessel "In care of Mrs. Smith" 12
kessel "In care of Mrs. Smith" 12 :: [Char]
