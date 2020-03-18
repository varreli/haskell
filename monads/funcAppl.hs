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
-- ghci> Node (Leaf (*10)) (Node (Leaf (+2)) (Leaf (+4))) <*> x






--  $ is "the function application operator" 
--  <*> is "the applicative function application operator"
