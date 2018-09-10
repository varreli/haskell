-- Sum types :

-- Sum types up to isomorphism are also symmetric:

Either a b ~ Either b a

-- The sum type is also associative ; we can write :

Triple a b c = Left a
             | Right c
             | Center b

-- To be a Monoid, we need the unit of sum :

  Either a Void ~ a
-- (+)   a  ()  = a        -- there's only one
                           -- inhabitant of Either:
                           -- an element of a. There 
                           -- is no right side 
                           -- constructor.
  (a, Void)      ~ Void  
-- (*) a  Void   = Void

-- So in basic algebra we have the
-- Distributive law with product and sum : 

    a * (b + c) ~ (a * b) + (a * c)

-- This in product form is:
   (a, Either b c)               -- AND (*)

-- In sum form it is:
   Either (a, b) (a, c)          -- OR (+)

-- This would be a ring though we have no inverses. 
-- So this is a semi-ring.

    2  =  1  +   1     -- What is the correspondence ? 
  Bool = ()  +  ()     -- Bool = R unit T | L unit F 

    1 + a              -- What is the correspondence ?
  
  data Maybe a = Nothing | Just a
                      
-- This corresponds to:

  data Either () a     -- Nothing ~ left () (True)
                       -- Right a ~ a
                       -- Just rename the constructors
                      
