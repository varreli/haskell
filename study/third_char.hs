-- all start with index at 0 : 

third1 :: String -> Char
third1 str = str !! 2

third2 :: String -> Char
third2 = ( !! 2) 

third3 :: Int -> Char
third3 x = "Persistence is key" !! x

third4 :: Int -> String -> Char
third4 x str = str !! x

