import Data.Char

data Arbor a = Leave a | Node (Arbor a) (Arbor a) deriving Show

instance Functor Arbor where
  fmap g (Leave x) = Leave (g x)
  fmap g (Node l r) = Node (fmap g l) (fmap g r)


-- eta reduction fails:

all_caps word = fmap toUpper word 

pointful list = fmap ((*10) . (+ 1)) list

-- eta reduction requires type declaration:

pointfree :: (Num b, Functor f) => f b -> f b
pointfree = fmap ((*10) . (+5)) 


-- RULE 1:

-- fmap    id      =      id         -- well-typed: id has
--       a -> a       f a -> f a     -- different type on rhs


-- RULE 2:    function composition:

ff :: Functor f => (b -> c) -> (a -> b) -> f a -> f c
ff g h = fmap (g . h)

palindrome :: Functor f => f [Char] -> f [Char]
palindrome = fmap (map toUpper . reverse)

