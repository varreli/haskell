fllp :: (a -> b -> c) -> b -> a -> c 
fllp = \f x y -> f y x 

-- fllp flips the expectation of argument order.
