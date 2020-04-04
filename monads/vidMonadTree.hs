data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

instance Functor Tree where
    fmap f (Leaf a) = Leaf (f a)
    fmap f (Node left right) = Node (fmap f left) (fmap f right)

instance Applicative Tree where
    pure = Leaf -- currying allows us to use beta reduction (?)
    Leaf f <*> treee = fmap f treee
    Node left right <*> treee = Node (left <*> treee) (right <*> treee)

instance Monad Tree where
    Leaf a >>= ff = ff a
    Node left right >>= ff = Node (left >>= ff) (right >>= ff)

g x 
    | x == 4 = (Leaf 99)
    | otherwise = Node (Leaf (x * 2)) (Leaf (x * 4))


-- For Tree Functor and Applicative, try:

-- ghci> x = Node (Leaf 4) (Node (Leaf 5) (Leaf 6))
-- ghci> Node (Leaf (*10)) (Node (Leaf (+11)) (Leaf (+13))) <*> x
-- ghci> (*) <$> Node (Leaf 2) (Node (Leaf 4) (Leaf 6)) <*> x

-- For Tree Monad, try:

-- ghci> x = Node (Leaf 4) (Node (Leaf 5) (Leaf 6))
-- ghci> x >>= g
-- Node (Leaf 99) (Node (Node (Leaf 10) (Leaf 20)) (Node (Leaf 12) (Leaf 24)))

-- ghci> Leaf 4 >>= g
-- Leaf 99

-- ghci> Node (Leaf 3) (Leaf 5) 
-- Node (Node (Leaf 6) (Leaf 12)) (Node (Leaf 10) (Leaf 20))


-- Try:

-- ghci> x = Node (Leaf 4) (Node (Leaf 5) (Leaf 6))
-- ghci> Node (Leaf (*10)) (Node (Leaf (+11)) (Leaf (+13))) <*> x
-- ghci> (*) <$> Node (Leaf 2) (Node (Leaf 4) (Leaf 6)) <*> x


--  $ is "the function application operator" 
--  <*> is "the applicative function application operator"
