-- xs is merely bound to bottom, its not evaluated:

Prelude> let x:x':xs = [1,2,undefined] in x' 
2

-- Whats produced and returned is the value of x' .
-- But x' is not evaluated.
-- Nothing else is evaluated either. The x and xs 
-- are discarded as they have gone out of scope.

Prelude> let x = 1 : x
         in ...

-- What happens here is that x is bound to 
-- a closure or 'thunk' (suspended computation) 
-- which, *when needed*, will evaluate to 1:x. 

-- x = 1 : x
-- won't crash things because the language is lazy 
-- and only takes what it needs. It evaluates the
-- 1, then goes to the : x which is 1, then goes to
-- the : x, which is 1 .    

-- Study jaredFib.hs
