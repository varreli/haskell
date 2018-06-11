act :: IO (Char,Char)
act = do x <- getChar
         getChar
         y <- getChar
         return (x,y)

gettLine :: IO String
gettLine = do x <- getChar
              if x == '\n' then
                 return []
              else
                 do xs <- gettLine
                    return (x:xs)

puttStr :: String -> IO ()
puttStr []     = return ()
puttStr (x:xs) = do putChar x
                    puttStr xs

puttStrLn :: String -> IO ()
puttStrLn xs = do puttStr xs
                  putChar '\n'

strlen :: IO ()
strlen = do puttStr "Enter a string: "
            xs <- gettLine
            puttStr "The string has "
            puttStr (show (length xs))
            puttStrLn " characters"

