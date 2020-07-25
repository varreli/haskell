archaephyrryx:

-- We don't need the second term in the let statement for
-- bind since we use LHS wholesale in the next line


tick = S (\s -> let (s', v) = runState get s in runState (put (v+1)) s')

tick = S (\s -> runState (put (s+1)) s)

tick = S (\s -> runState (S (\s -> (s+1, ())) s)

tick = S (\s -> (s+1, ()))
