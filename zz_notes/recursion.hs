-- from:
-- https://mail.haskell.org/
-- pipermail/beginners/2009-February/000901.html

-- let x = 1:x
-- in ...

-- What happens here is that x is bound to a closure or 
-- 'thunk' (suspended computation) which, *when needed*, 
-- will evaluate to 1:x.This is laziness at work.  x is not 
-- 'uninitialized'; it is perfectly well initialized to 
-- this thunk.

 tracePlus b = let (c,d) = (d,b:d) 
               in c
 main = do
      w <- return $ take 10 $ tracePlus 7
      print w



-- recursion can be the function itself, as in map:
-- @src map -- xchat command  

-- <lambdabot> map _ []     = []
-- <lambdabot> map f (x:xs) = f x : map f xs
