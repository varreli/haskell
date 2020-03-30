-- class Functor f where
--    fmap :: (a -> b) -> f a -> f b

-- class Functor f => Applicative f where
--     pure :: a -> f a
--     (<*>) :: f (a -> b) -> f a -> f b


-- ghci> (+3) <$> (Just 8)
-- Just 11

-- Applicative allows us to wrap a function (here, in a Just) :

-- ghci (Just (+3)) <*> (Just 9)
-- Just 11

data Maybe2 a = Just2 a | Nothing2 deriving Show

instance Functor Maybe2 where
  fmap f (Just2 a) = Just2 (f a)
  fmap f Nothing2  = Nothing2

instance Applicative Maybe2 where
    pure = Just2
--  Just2 f <*> Just2 j = Just2 (f j) -- but easier to use fmap:
    Just2 f <*> j = fmap f j 
    Nothing2 <*> j = Nothing2

-- ghci> (*) <$> (Just 10) <*> (Just 3) 


data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

instance Functor Tree where
    fmap f (Leaf a) = Leaf (f a)
    fmap f (Node left right) = Node (fmap f left) (fmap f right)

instance Applicative Tree where
    pure = Leaf -- currying allows us to use beta reduction (?)
    Leaf f <*> treee = fmap f treee
    Node left right <*> treee = Node (left <*> treee) (right <*> treee)


-- Try:

-- ghci> x = Node (Leaf 4) (Node (Leaf 5) (Leaf 6))
-- ghci> Node (Leaf (*10)) (Node (Leaf (+11)) (Leaf (+13))) <*> x
-- ghci> (*) <$> Node (Leaf 2) (Node (Leaf 4) (Leaf 6)) <*> x


--  $ is "the function application operator" 
--  <*> is "the applicative function application operator"
