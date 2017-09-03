-- let x = 1:x
-- in ...

-- What happens here is that x is bound to 
-- a closure or 'thunk' (suspended computation) 
-- which, *when needed*, will evaluate to 1:x.
-- This is laziness at work. x is not 
-- 'uninitialized'; it is well-initialized 
-- to this thunk.  
-- x = 1 : x won't destroy your computer because 
-- the language is lazy and only takes what it 
-- needs. It evaluates the 1, then goes to the 
-- : x which is 1, then goes to the : x, which is
-- 1 .

 tracePlus b = let (c, d) = (d, b:d) 
               in c
 main = do
      w <- return $ take 10 $ tracePlus 7
      print w



-- recursion can be the function itself, as in map:
-- @src map -- xchat command  

-- <lambdabot> map _ []     = []
-- <lambdabot> map f (x:xs) = f x : map f xs
