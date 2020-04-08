-- Many things in haskell are just complicated ways to talk about state:

type State = Int
newtype Staat a = S (State -> (a, State)) -- newtype requires 
                                       -- dummy constructor S

app :: Staat a -> State -> (a, State)
app (S st) x = st x

instance Functor Staat where
--  fmap :: (a -> b) -> Staat a -> Staat b
  fmap g st = S (\s -> let (x,s') = app st s
                           in (g x, s'))

instance Applicative Staat where
 -- pure :: a -> Staat a
    pure x = S (\s -> (x,s))
 -- (<*>) :: Staat (a -> b) -> Staat a -> Staat b
    stf <*> stx = S (\s -> let (f,s') = app stf s 
                               (x,s'') = app stx s' 
                               in (f x, s''))
                       


-- re: instance Applicative Staat :

-- The state being passed from `stf` to `stx` is s'
 
-- giving state to stf results in a tuple of a new state 
-- called s' and a function called f. this is what the 
-- line        let (f,s') = app stf s        is doing.
 
-- that new state s' is then used to give state to stx, 
-- giving another new state called s'' and a value 
-- called x. the last thing we do is apply our function 
-- f to our value x because that's what our type signature 
-- requires, and bundle that with the last state.

instance Monad Staat where
-- (>>=) :: Staat a -> (a -> Staat b) -> Staat b
  st >>= f = S (\s -> let (x,s') = app st s
                          in app (f x) s')

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

tree :: Tree Char
tree = Node (Node (Leaf 'a') (Leaf 'b')) (Leaf 'c')

rlabel :: Tree a -> Int -> (Tree Int, Int)
rlabel (Leaf _) n = (Leaf n, n+1)
rlabel (Node l r) n = (Node l' r', n'')
    where
      (l', n')  = rlabel l n
      (r', n'') = rlabel r n'

-----------------------------------------------------

fresh :: Staat Int
fresh = S (\n -> (n, n+1))

relabel :: Tree a -> Staat (Tree Int)
relabel (Leaf _) = Leaf <$> fresh
relabel (Node l r) = Node <$> relabel l <*> relabel r

-----------------------------------------------------













