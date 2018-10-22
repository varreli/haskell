-- Note on find function in tautCheck.hs :

-- Types of more than one parameter are permitted. A type of
-- lookup tables that associate keys of one type to values of
-- another type can be declared as a list of (key, value) pairs:

type Assoc k v = [(k,v)]

find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k', v) <- t, k == k']

-- This function returns the first value associated with a given
-- key from the table 't' of type [(k,v)].
