fstString :: [Char] -> [Char]
fstString o = o ++ " in the rain"

sndString :: [Char] -> [Char]
sndString oo = oo ++ " over the rainbow"


sing = if (x > y) then (fstString x) else (sndString y)
   where x = "Singin"
         y = "Somewhere"
