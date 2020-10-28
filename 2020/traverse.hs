data Tree a = Con a | Add (Tree a) (Tree a)
    deriving (Eq, Show)

instance Functor Tree where
    fmap f (Con a) = Con (f a)
    fmap f (Add x y) = Add (fmap f x) (fmap f y)

instance Foldable Tree where
    foldr f b (Con a)   =  f a b
    foldr f b (Add x y) = (foldr f) (foldr f b x) y

instance Traversable Tree where
    traverse fn (Con a)   = Con <$> (fn a)
    traverse fn (Add x y) = Add <$> (traverse fn x) <*> (traverse fn y)


aa = foldr (*) 1 t2

t2 = (Add (Add (Con 6) (Con 7)) (Con 10))

 
zero x = if (x > 0) then Just ((+) x 5) else (Just 0) 

t1 = (Add (Add (Con 3) (Con 4)) (Con (-5)))

bb = traverse zero t1
-- Just Add (Add (Con 8) (Con 9)) (Con 0)


evens x = if even x then Just (x `div` 2) else Nothing

list = [2,4,6,7]

cc = traverse evens list 
-- Nothing


-------------------------------------------------------------------------

-- https://blog.plover.com/prog/haskell/traversable.html

-- future study of categories and traversable:
-- https://duplode.github.io/posts/traversable-a-remix.html
