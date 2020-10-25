data Tree a = Con a | Add (Tree a) (Tree a)
    deriving (Eq, Show)

instance Functor Tree where
    fmap f (Con a) = Con (f a)
    fmap f (Add x y) = Add (fmap f x) (fmap f y)


https://blog.plover.com/prog/haskell/traversable.html
