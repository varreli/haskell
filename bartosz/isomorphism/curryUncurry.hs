curryy :: ((a, b) -> c) -> a -> b -> c
curryy f x y = f (x, y) 

uncurryy :: (a -> b -> c) -> (a, b) -> c
uncurryy f p = f (fst p) (snd p)

cury f = g
    where g x y = f (x,y)

uncury f (s,t) = f s t


-- curry converts functions that normally take tuple arguments f (a,b).
-- uncurry converts functions that normally take parameter arguments f a b.
