-- conversion functions forming isomorphism 2:

ff :: (a -> ()) -> ()
ff _ = ()

gg :: () -> a -> ()
gg = \_ _ -> ()

convertt = ff . gg
myconvertt = convertt ()

