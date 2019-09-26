curryy :: ((a, b) -> c) -> a -> b -> c
curryy f x y = f (x, y) 

uncurryy :: (a -> b -> c) -> (a, b) -> c
uncurryy f p = f (fst p) (snd p)
