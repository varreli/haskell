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

ff x = if (x > 0) then Just ((+) x 5) else (Just 0) 

t1 = (Add (Add (Con 3) (Con 4)) (Con (-2)))

bb = traverse ff t1
-- Just Add (Add (Con 8) (Con 9)) (Con 0)

-- Evaluation:

-- 1 traverse ff (Add (Add (Con 3) (Con 4)) (Con (-2))) 
-- 2 Add <$> traverse ff (Add (Con 3) (Con 4)) <*> traverse ff (Con (-2))
-- 3 Add <$> (Add <$> traverse ff (Con 3) <*> traverse ff (Con 4) 
--   <*> (Con <$> ff (-2)) 
-- 4 Add <$> Just (Add (Add (Con 8) (Con 9))) <*> Just (Con 0)

-- Just Add (Add (Con 8) (Con 9)) (Con 0)
