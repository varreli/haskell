f :: a -> () -> a
f = \x _ -> x

g :: (() -> a) -> a
g k = k ()

convert = f . g
main = print $ convert (\_ -> "hello")

