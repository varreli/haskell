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


-- Now the algebra of a List :

  L(a) = 1 + a * L(a)
  L(a) - a * L(a) = 1
  
 (1 * L(a)) - (a * L(a)) = 1       -- factor out 1 
  
  L(a) (1 - a) = 1
  L(a) = 1 / (1 - a)

-- This corresponds to the List type :

  data List a = Nil | Cons a (List a)  
  
  -- List is a sum with 2 constructors: Nil and Cons
  -- Cons is a product type with 2 arguments, head and tail:
  -- (a, (List a) )

  -- This leads to the summation of all Lists:

  -- oo Sum n = 0  a^n = 
  --                    1 + [singleton] + [a,a] + [a,a,a] ...

  -- This is also the sum of a geometric sequence.

  -- Using substitution:
  L(a) = 1 + a * L(a)
  L(a) = 1 + a * (1 + a * L(a) ) 
       = 1 + a + 2a (1 + a * L(a) )
       = 1 + a + 2a + 3a (1 + a * L(a) ... OO

-- Note this can be formalized in a fixed point combinator.
