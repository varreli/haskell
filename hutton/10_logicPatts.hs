(||>) :: Bool -> Bool -> Bool
True ||> True = True
True ||> False = True
False ||> True = True
False ||> False = False



-- (1)

--  True && True = True
--  _ && _ = False          

--  equivalent without operators:

(&&&) :: Bool -> Bool -> Bool
x &&& y = if x == True
  then if y == True
    then True
    else False
  else False         -- this last else closes 1st 
                     -- if expression



-- (2) 

-- True && b = b
-- False && _ = False  :

-- equivalent without operators:

(&&>) :: Bool -> Bool -> Bool 
x &&> y = if x == True
              then y
            else False
