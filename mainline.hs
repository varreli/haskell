main :: IO ()
main = do
  i <- getLine
  if i /= "quit" then do
    putStrLn ("Input: " ++ i)
    main
  else
    return ()
