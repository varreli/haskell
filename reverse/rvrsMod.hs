module Reverse where

rvrs :: String -> String
rvrs str = concat [last, " ", middle, " ", first]
  where first = take 5 str 
        middle = take 2 $ drop 6 str
        last = take 7 $ drop 9 str

main = do
   print (rvrs "Might be forlorn") -- note ()
   print $ rvrs "Might be forlorn" -- note $

-- evaluated from right first (inside parens)
 
-- book says "not the loveliest reverse" .
