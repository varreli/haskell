-- conversion functions forming isomorphism 1:

f :: a -> () -> a
f = \x _ -> x


g :: (() -> a) -> a
g k = k ()             -- k is applied to () , its an expression


convert :: (() -> a) -> (() -> a)    -- note identity
convert = f . g
myconvert = convert (\() -> "hello")

-- trace : 

--     myconvert ()
--  =  convert (\() -> "hello") ()
--  =  (f . g) (\() -> "hello") ()
--  =  f (g (\() -> "hello")) ()
--  =  (\x _ -> x) (g (\() -> "hello")) ()
--  =  g (\() -> "hello")
--  =  (\() -> "hello") ()
--  =  "hello"

