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
 
aa x = if (x>0) then Just ((+) x 5) else (Just 0) 

t1 = (Add (Add (Con 3) (Con 4)) (Con (-5)))

-- ghci> traverse aa t1
-- Just Add (Add (Con 8) (Con 9)) (Con 0)

bb x = if even x then Just (x `div` 2) else Nothing

list = [2,4,6,7]
-- ghci> traverse bb list 
-- Nothing

-------------------------------------------------------------------------

-- https://blog.plover.com/prog/haskell/traversable.html

-- future study of categories and traversable:
-- https://duplode.github.io/posts/traversable-a-remix.html
