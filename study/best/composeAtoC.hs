-- The function arrow contains the lambda symbol:

co :: (b -> c) -> (a -> b) -> a -> c
co = (.)

-- co f g = (f . g)
-- co f g = \x -> f (g x)

-- [ f . g = f (g x) ]


--
-- Prelude> :t (\x -> x + 1) . (\x -> x - 2)
-- Num c => c -> c


-- Since      \ f g -> f . g        -- infix
-- which is   \ f g -> (.) f g      -- prefix
-- which is   \ f -> \ g -> (.) f g
-- which is   \ f -> (.) f          -- drop g
-- which is   (.)                   -- drop f

-- dropping on both sides is eta reduction.

-- Type definitions can be eta reduced as well,
-- at least in some circumstances. unlike value
-- level, though, there is no partial application
-- at type level; all types must resolve to fully
-- applied. Some exceptions with Functors, etc.
