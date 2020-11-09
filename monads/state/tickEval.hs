instance Applicative ST where
-- pure :: a -> ST a
  pure x = S (\s -> (x, s))

-- (<*>) :: ST (a -> b) -> ST a -> ST b
  stf <*> stx = do f <- stf
                   x <- stx
                   S (\s -> ((f x), s))


-- https://github.com/RoccoMathijn/programming-in-haskell/blob/master/chapter12.hs
