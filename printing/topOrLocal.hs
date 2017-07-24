module TopOrLocal where

topLevelFunction :: Integer -> Integer
topLevelFunction x = x + woot * topLevelValue
  where woot :: Integer
        woot = 10 -- local binding defined

topLevelValue :: Integer
topLevelValue = 5
