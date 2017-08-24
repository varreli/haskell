arith :: Num b => (a -> b) -> Integer -> a -> b
arith f i a = (f a) + (fromInteger i) 

-- Prelude> arith fromRational 1 (2/1)
-- Prelude> arith fromInteger 3 5

-- determine parameter order in terms of what's 
-- easier for partial application, though 
-- technically it is abitrary.

