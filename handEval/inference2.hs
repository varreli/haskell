1) Assign every variable a unique type variable.
f x y z = (x + y) : z

x == a
y == b
z == c

2) Assign every function it's type signature with new unique variables:

(+) :: Num d => d -> d -> d
(:) :: e -> [e] -> [e]

3) Derive equations from subexpressions:

from (x + y) 
derive a == d and b == d

from (x + y) : z 
derive d == e and [e] == c

















-----------------------------------------------------------

f x = x : x

x ~ a

(:) :: b -> [b] -> [b]

from (x : x) 
we derive a ~ b and a ~ [b] -- Type error!

