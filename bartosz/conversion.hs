-- conversion functions forming isomorphism 1:

f :: a -> () -> a
f = \x _ -> x

g :: (() -> a) -> a
g k = k ()

convert :: (() -> a) -> (() -> a)    -- note identity
convert = f . g
myconvert = convert (\() -> "hello")


-- conversion functions forming isomorphism 2:


ff :: (a -> ()) -> ()
ff _ = ()

gg :: () -> a -> ()
gg = \_ _ -> ()

convertt = ff . gg
myconvertt = convertt ()

