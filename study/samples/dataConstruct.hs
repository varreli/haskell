type Name = String

data Pet = Cat | Dog Name deriving Show

x = Dog "Bart"
y = Cat

-- Cat is a nullary data constructor for Pet
-- and Dog is a data constructor that takes an
-- argument.
