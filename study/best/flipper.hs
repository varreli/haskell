flipper :: (x -> y -> z) -> (y -> (x -> z)) 
flipper f a b = f b a

flipp :: (x -> y -> z) -> (y -> x -> z)
flipp f a b = f b a

flips :: (x -> y -> z) -> y -> x -> z
flips f a b = f b a

flipps :: (x -> y -> z) -> y -> x -> z
flipps ff = gg
  where gg a b = ff b a
