module Auxillaries where

import Data.Char

next :: Int -> Int
next 1 = 2
next 2 = 1

type Board = [Int]

initial :: Board
initial = [5,4,3,2,1]

initiall :: Board
initiall = [9,8,7,6,5,4,3,2,1]

finished :: Board -> Bool
finished = all (== 0)

valid :: Board -> Int -> Int -> Bool
valid board row num = board !! (row - 1) >= num

move :: Board -> Int -> Int -> Board
move board row num = [update r n | (r,n) <- zip [1..] board]
    where 
    update r n = if r == row then (n - num) else n   -- n-num is subtraction !

putRow :: Int -> Int -> IO ()
putRow row num = do putStr (show row)
                    putStr ": "
                    putStrLn (concat (replicate num "* "))

putBoard :: Board -> IO ()
-- putBoard [a,b,c,d,e] = do putRow 1 a
--                           putRow 2 b
--                           putRow 3 c
--                           putRow 4 d
--                           putRow 5 e

putBoard = puttBoard 1                         -- exercise 2 (variation)
puttBoard r []     = return ()
puttBoard r (n:ns) = do putRow r n
                        puttBoard (r + 1) ns


getDigit :: String -> IO Int
getDigit prompt = do putStr prompt
                     x <- getChar
                     newline
                     if isDigit x then
                        return (digitToInt x)
                     else
                        do putStrLn "ERROR: Invalid digit"
                           getDigit prompt

newline :: IO ()
newline = putChar '\n'

