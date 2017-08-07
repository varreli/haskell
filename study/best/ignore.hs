
agg :: (a -> c) -> a -> a  -- more complex type
fug :: (a -> a) -> a -> a  -- than inferred.
fot :: a -> b -> b


agg f x = x
fug f x = x
fot f x = x


-- ignore the first argument.
-- (a -> c) don't need to be different types
-- but they can be. The function *does* need
-- the types of its arguments to be related,
-- even if one of those arguments is not used.

-- we could have (a -> d) in first argument.


-- similar to identity:

ash :: (a -> b) -> a -> b
ash f = f

azz :: (a -> b) -> a -> b
azz f x = f x
