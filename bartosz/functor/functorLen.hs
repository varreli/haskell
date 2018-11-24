
b :: (Functor f, Foldable t) => f (t a) -> f Int
b = (<$>) length

-- λ > tx [(Just 4.5), (Just 2), (Just 3.3), Nothing, (Just 5.66)]
-- [1,1,1,0,1]

-- This returns a function operating on a functor (given 
-- constraints on the element type originating from 
-- length, namely Foldable)

-- λ > tx [(Just 4.5), (Just 2), (Just 3.3), Nothing, (Just 5.66)]
-- [1,1,1,0,1]

-- This returns a function operating on a functor (given 
-- constraints on the element type originating from 
-- length, namely Foldable)

-- Functor wants a type constructor that takes one type 
-- and not a concrete type:

-- a : []
-- Maybe
-- Either a   -- b makes it concrete
-- Tree

-- Functor wants a type constructor that takes one type 
-- and not a concrete type:

-- a : []
-- Maybe
-- Either a   -- b makes it concrete
-- Tree
