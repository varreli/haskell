module Reverse where
rvrs :: String -> String

rvrs x = concat [awesomeString, " ", isString, " ", curryString]
  where curryString = take 5 x
        isString = take 2 $ drop 6 x
        awesomeString = take 7 $ drop 9 x
