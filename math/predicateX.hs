-- If the set X is a subset of Y, but the structure 
-- of the set X is outside the descriptive capacity 
-- of the type system, then X could be represented as 
-- a predicate (in Haskell) :      
-- 
-- isX :: Y -> Bool
-- 
-- Write a function which takes a list of integers and 
-- produces a list of only the primes in the output, 
-- and encode the postcondition. We would hope the type
-- of the output is [Prime] , but we cannot do this, so we
-- first produce an output of [Int] , then use a predicate 
-- that will return a Bool:

isFactor n = [ x | x <- [1..n] , mod n x == 0]

primeCheck :: Integral a => a -> Bool
primeCheck n = isFactor n == [1,n]

-- We'd like to have a datatype representing a set X 
-- (the primes), but if we're unable to express this type, 
-- then we can instead take a superset Y (the integers) 
-- which has an expressible type, and whenever we expect a 
-- value from X, we instead receive a value from Y and test 
-- it with our predicate. So instead of a type Prime, we 
-- have the type Integer plus the promise that if you test 
-- the value with primeCheck, you'll get True/False.

-- Set X, the primes, needs to be thought of as a predicate 
-- representation; since X is too abstracted to have a 
-- viable solution in code, we use a more mundane solution 
-- which we define as a predicate. 

-- But the above does not refer to representation theory.

-- In representation theory, you study a group G or a monoid M 
-- via homomorphisms “φ : G → Aut(X)” or “φ : M → End(X)”. But
-- the primes do not form a group or even a monoid under any 
-- sensible operation. " Representation " in computer science 
-- typically means something else altogether.

-- Question: how does this explain the Curry-Howard Isomorphism?
