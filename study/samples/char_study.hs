exclamation x = "" ++ exclaim
  where exclaim = x ++ " !"

f1 :: String -> String
f1 = (++"!")


-- these return a list and a string : 

drop4Take5 :: String -> [Char]
drop4Take5 x = take 5 $ drop 4 x

f2 :: String -> String
f2 str = ((take 5).(drop 4)) str

-- returns a single char with zero index :

thirdLetter :: String -> Char
thirdLetter str = str !! 2

-- other examples :

letterIndex :: Int -> Char
letterIndex num = "Curry is Awesome" !! num

f3 = drop 9

