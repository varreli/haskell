
> :t id
a -> a

-- specialize this for flip:

(b -> c) -> (b -> c)
(b -> c) -> b -> c

-- then (b -> c) and b are flipped:

> :t flip id
b -> (b -> c) -> c  
-- (b -> c) is unary since all functions in
-- haskell are unary. but the ghc is polymorphic
-- so this function can take n arguments.


λ >  flip id :: b -> (b -> c) -> c
λ > :t flip id 4 (/)
flip id 4 (/) :: Fractional b => b -> b
λ > :t flip id 4 (/) 2
flip id 4 (/) 2 :: Fractional b => b


-- y x is a function application: we're 
-- applying `y` to `x` :

-- flip id x f y => f x y

-- flip id 4 (/) 2     is equivalent to :
-- flip ($) 4 (/) 2



-- study : http://evan-tech.livejournal.com/240180.html

-- study : https://github.com/uwedeportivo/NikePlus-Cocoa-RunLog/wiki/publishing-nike-runs,-intermission%3A-flip-id
