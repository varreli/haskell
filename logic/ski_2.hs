-- For zero:
zero = K I 
K I Succ Zero
I Zero
Zero

one = I
I (Succ Zero)
Succ Zero

-- For two, we repeat the Succ function 
-- by composing f . g h = f (g h)

-- S f g h    -- S repeats function :
-- f h (g h)  -- first h is problematic
-- K f h (g h)
-- f (g h)
--
-- 
two = 
λ > two Succ Zero
Succ (Succ Zero)

-- compare s type to <*> :

s   :: (t2 -> t1 -> t) -> (t2 -> t1) -> t2 -> t

(<*>) :: Applicative f => f (a -> b) -> f a -> f b
