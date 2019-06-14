data Unit = Unit
-- has the cardinality of 1, it's singular value is Unit 

data Bool = False | True 
-- has the cardinalty of 2, values False and True

data Maybe a = Nothing | Just a
-- has 1 + (the cardinality of all a) 

data Maybe Bool 
-- has the cardinality of 3: Nothing | Just False | Just True

data List a = Nil | Cons a (List a)
-- has the cardinality 1 + a^n       -- 1 == [] == n^0

