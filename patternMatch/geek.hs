-- let x = 1 : x
-- in ...

-- xs is merely bound to bottom, its not evaluated:

Prelude> let x:x':xs = [1,2,undefined] in x' 
2

-- Whats produced and returned is the value of x' .
-- x' is not evaluated.
-- Nothing else is evaluated either. The x and xs 
-- are discarded as they have gone out of scope.

