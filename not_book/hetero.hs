-- two ways to have lists be heterogeneous (first preferred) :

data Object = IntObject Int | StringObject String

objectString :: Object -> String
objectString (IntObject v ) = show v
objectString (StringObject v) = v

main = mapM (putStrLn . objectString) [(IntObject 7), (StringObject "eight")]

-------

data T
   = ConsInt    Int
   | ConsString String
   | ConsChar   Char
   deriving Show

-- > [ConsInt 42, ConsChar 'a', ConsString "foo"]
