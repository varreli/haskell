data Bool = False | Type

data Trivial = Trivial'

-- No arguments (parameters), so these are nullary.
-- Type and data constructors that take no arguments
-- are called constants, storing a fixed type and data.
-- No arguments is needed to be fully realized as a type.
-- It's concrete on its own. 

-- Constructors which take arguments are like functions
-- in a sense, since they are applied to become a
-- concrete type or value :

data UnaryTypeCon a = UnaryValueCon a

-- This is not like a term level function; it doesn't
-- perform an operation on data.
