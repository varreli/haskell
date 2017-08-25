-- define the data type:

data Trivial = Trivial'

instance Eq Trivial where
  Trivial' == Trivial' = True

-- Here we create an instance that tells 
-- the compiler how to test the datatype 
-- Trivial for equality.
