import Auxillaries

play :: Board -> Int -> IO ()
play board player = do newline
                       putBoard board
                       if finished board then
                          do newline
                             putStr "Player "
                             putStr (show (next player))
                             putStr " wins!!"
                             newline

                       else 
                          do newline
                             putStr "Player "
                             putStrLn (show player)
                             row <- getDigit "Enter a row number: "
                             num <- getDigit "Stars to remove: "
                             if valid board row num then
                                play (move board row num) (next player)
                             else
                                do newline
                                   putStrLn "ERROR: Invalid move"
                                   play board player
