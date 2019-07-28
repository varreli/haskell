import Data.Char

data Arbor a = Leave a | Node (Arbor a) (Arbor a) deriving Show

instance Functor Arbor where
  fmap g (Leave x) = Leave (g x)
  fmap g (Node l r) = Node (fmap g l) (fmap g r)


-- eta reduction fails:

all_caps word = fmap toUpper word 
                                              
mathy list = fmap ((*10) . (+5)) list

