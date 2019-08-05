import Debug.SimpleReflect

ff = map Just $ [(+), (*), (^)] <*> [a,b] <*> [1,2,3] :: [Maybe Expr]
