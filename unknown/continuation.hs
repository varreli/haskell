{-# LANGUAGE RankNTypes #-}

f :: a -> (a -> r) -> r
f a b = b a

g :: (forall r. (a -> r) -> r) -> a
g a = a id

-- continuations related to tail recursion. study.
