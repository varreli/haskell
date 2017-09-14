fllp :: (a -> b -> c) -> b -> a -> c 
fllp = \f x y -> f y x 

ggg :: (a -> b) -> a -> c -> b
ggg = \f a c -> f a

