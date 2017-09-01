module RegisteredUser where

newtype Username = Username String
newtype AccountNum = AccountNum Integer

data User = UnregisteredUser | RegisteredUser 
                             Username AccountNum

printUser :: User -> IO ()
printUser UnregisteredUser = putStrLn "UnregisteredUser"
printUser (RegisteredUser (Username name)
                          (AccountNum acctNum))
          = putStrLn $ name ++ " " ++ show acctNum


-- As programmers we still have 2 newtypes; but the 
-- types get erased at compile time, and what is 
-- left are raw pointers to the actual values, as
-- in machine language. There is nothing to evaluate
-- so no laziness. Laziness requires that something 
-- be evaluated at a later stage. Newtypes are 
-- needed wrappers for User but don't exist in the 
-- final program. A newtype is a note to the type
-- checker. It exists only for the type checker. It
-- has no other existence. 

-- On lines 3 and 4, there is no assignment, only 
-- matching and binding. These are matched to the
-- data type User. We need the newtypes to pattern
-- match on.
 
-- There maybe a bottom, as when a program fails to
-- terminate or we have a pattern match failure. 
-- A bottom is a fake value, but it is a value. 
-- To avoid bottoms we sometimes use the wildcard 
-- '_' when writing the final pattern match.
