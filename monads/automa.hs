data U x = U [x] x [x]
  deriving Show 


right (U a b (c:cs)) = U (b:a) c cs
left  (U (a:as) b c) = U as a (b:c)

gg = U [-2,-3..(-8)] (-1) [0,1..8]

-- We represent a 'universe' as a centre point, a list of all elements 
-- to the left of that centre point and a list of all elements to the 
-- right. The type U x is a doubly infinite sequence with a cursor 
-- (we can move (-1) to the left or right).

instance Functor U where
    fmap f (U a b c) = U (map f a) (f b) (map f c)

class Functor w => Comonad w where
    (=>>) :: w a -> (w a -> b) -> w b
    coreturn :: w a -> a
    cojoin   :: w a -> w (w a)
    x =>> f = fmap f (cojoin x)

-- http://blog.sigfpe.com/2006/12/evaluating-cellular-automata-is.html
