import Control.Applicative

halve x = if even x then Just (x `div` 2) else Nothing

-- traverse turns things inside a Traversable into a Traversable 
-- of things "inside" an Applicative, given a function that 
-- makes Applicatives out of things:

ff = traverse halve [2,4,6]
-- Just [1,2,3]

