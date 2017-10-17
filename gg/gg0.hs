-- all are combinators since there are
-- no free variables :

-- \a -> a                     id
-- \a -> \b -> a               const 
-- \f -> \a -> \b -> f b a     flip


-- define const :
-- \a -> \b -> a
-- const x _ = x

Prelude> const 6 5
6

Prelude> const (id 6) 5  
6                     

Prelude> const id 6 5   -- const id 6 = id   
5                       -- then, id 5 = 5

Prelude> flip const 6 5
5

-- const id == flip const

-- const id seems a terrible way to express 
-- the concept, flip const is easier to 
-- understand.




