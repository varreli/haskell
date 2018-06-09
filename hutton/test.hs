act :: IO (Char,Char)
act = do x <- getChar
         getChar
         y <- getChar
         return (x,y)

