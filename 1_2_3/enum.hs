ff :: Enum a => Int -> a -> [a]
ff x y = take x . enumFrom $ y

-- Prelude> ff 4 100
-- [100, 101, 102, 103]

g :: Integral a => Int -> a -> [a]
g x y = take x . filter odd . enumFrom $ y

-- λ > g 4 100
-- [101, 103, 105, 107]


-- λ > take 5 (enumFrom [1..])

-- <interactive>:80:1: error:
--     • Non type-variable argument in the constraint: Enum [t]
--           (Use FlexibleContexts to permit this)
-- 	      • When checking the inferred type
-- 	              it :: forall t. (Enum [t], Enum t, Num t) => [[t]]
