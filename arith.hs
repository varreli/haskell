arith :: Num b => (a -> b) -> Integer -> a -> b
arith f i a = (f a) + (fromInteger i) 

-- Prelude> arith fromRational 1 (2/1)
-- Prelude> arith fromInteger 3 5
-- Prelude> arith length 3 [3,4,5,6]

-- the fromInteger will adapt to any type with 
-- a Num instance so we need to use the type of 
-- the function f to pick an instance.

-- determine parameter order based on what's 
-- easier for partial application, though 
-- technically it is abitrary.



-- note partial application:

-- λ > :t arith fromRational

-- arith fromRational :: 
-- Fractional b => Integer -> Rational -> b
--
-- Here, b is constrained to Fractional; 
-- fromRational picked Fractional since it has
-- an instance of Num.
