ff :: Enum a => Int -> a -> [a]
ff x y = take x . enumFrom $ y

-- Prelude> ff 4 100
-- [100, 101, 102, 103]

g :: Integral a => Int -> a -> [a]
g x y = take x . filter odd . enumFrom $ y

-- Prelude> g 4 100
-- [101, 103, 105, 107]


