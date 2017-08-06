co :: (b -> c) -> (a -> b) -> a -> c

co = (.)

-- textbook states only one version of this signature 
-- will typecheck.
