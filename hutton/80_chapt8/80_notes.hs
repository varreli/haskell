-- Cale says:

-- we're taking replacements for each of the data 
-- constructors, and making those replacements through 
-- out the structure. we could write it like:

data Expr = Val Int | Add Expr Expr deriving Show

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a

folde f g (Val x) = f x
folde f g (Add x y) = g (folde f g x) (folde f g y)

folde2 val add = f
    where f (Val x)   = val x
          f (Add x y) = add (f x) (f y)


-- The idea is to replace each Add with add and each Val 
-- with val throughout the entire structure.

-- So if we have : 

tt = folde2 (+ 0) (+) (Add (Val 5) (Add (Val 1) (Val 2)) )

-- the result we would want is:
-- add (val 5) (add (val 1) (val 2))



-- Another use example, perhaps we want to know the depth 
-- of the expression

depth = folde (const 0) (\d1 d2 -> 1 + max d1 d2)

-- Or perhaps we'd just like to flip the entire expression 
-- over, reversing all the Adds

flipExpr = folde Val (flip Add)

-- that turns  Add (Val 1) (Add (Val 2) (Val 3)) into  
-- Add (Add (Val 3) (Val 2)) (Val 1)


-- As your expressions get more complicated, there will be 
-- more interesting functions to write...for example, if 
-- there were lambdas, perhaps we could write something 
-- to collect up all the free variables
