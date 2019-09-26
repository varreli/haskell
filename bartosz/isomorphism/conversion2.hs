-- conversion functions forming isomorphism 2:

ff :: (a -> ()) -> ()
ff _ = ()

gg :: () -> a -> ()      -- a is never used
gg = \_ _ -> ()          -- \() we have currying; returns ()

convertt = ff . gg
myconvertt = convertt ()

-- trace : 

--   myconvertt
-- = convertt ()
-- = (ff . gg) ()
-- = ff (gg ())
-- = () 

-- > let f _ = () in f (error "boo")
-- ()

