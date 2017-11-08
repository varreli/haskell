import Debug.Trace

eucllid :: Int -> Int -> Int
eucllid n m | traceShow (n, m) False = undefined
eucllid n 0 = n
eucllid n m = eucllid m ( mod n m)


-- Prelude> eucllid 6 27

-- eucllid 27 6
-- eucllid 6 27
-- eucllid 3 3
-- eucllid 3 0  => 3

-- study this as an example of quotient types.
-- Haskell does not have them, but research similar.

