munge :: (x -> y) -> (y -> (w, z)) -> x -> w
munge f g = fst . g . f

-- munge takes 
-- 3 arguments ((x -> y), (y -> (w, z)), x) 
-- and gives one result (w) .
-- The first argument is itself a function, one 
-- that takes an 'x' and results in a 'y' .
-- The second argument to murge is a function 
-- that takes a 'y' and results in both a 'w' 
-- and a 'z', in a tuple. The third argument 
-- to munge is a value of type x.   

-- The definition side of partial application 
-- shows that if 

f x = g x   
-- is a good definition, then
f = g

-- is also a fine definition and means the same
-- thing (to a first approximation) . This is
-- eta reduction. Without reduction we have:

munge f g x = (fst . g . f) x
munge f g x = fst (g (f x))
