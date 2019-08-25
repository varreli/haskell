-- The only thing a functor can do is alter the end 
-- result of a computation via some pure function a -> b.

class Functor f where
   fmap :: (a -> b) -> f a -> f b

-- but compare the applicative functor:

class Functor f => Applicative f where
      pure   :: a -> f a
      (<*>)  :: f (a -> b) -> f a -> f b

-- The <*> is the crucial difference here, since it 
-- allows the chaining of two computations: 

-- f (a -> b) 

-- (a computation which produces a function) and 

-- f a 

-- (a computation that provides the parameter to which 
-- the function is applied) 

--Using pure and <*> it's possible to define e.g :

(*>) :: f a -> f b -> f b

-- which simply chains two computations, discarding the 
-- end result from the first one (but possibly applying 
-- "side effects").

-- So in short, it's the ability to chain computations 
-- which is the minimum requirement for effects such 
-- as mutable state in computations.
