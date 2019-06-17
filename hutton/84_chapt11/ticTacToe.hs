import Data.Char
import Data.List
import System.IO

size :: Int
size = 3 

type Grid = [[Player]]

data Player = O | B | X
              deriving (Eq, Ord, Show)

next :: Player -> Player
next O = X
next B = B
next X = O

empty :: Grid
empty = replicate size (replicate size B)

full :: Grid -> Bool
full = all (/= B) . concat

whoseTurn :: Grid -> Player
whoseTurn g = if os <= xs then O else X
  where
    os = length (filter (== O) ps)
    xs = length (filter (== X) ps)
    ps = concat g

wins :: Player -> Grid -> Bool
wins p g = any line (rows ++ cols ++ dias)
           where
              line = all (== p)
              rows = g
              cols = transpose g
              dias = [diag g, diag (map reverse g)]

-- transpose :: [[a]] -> [[a]]             -- from Data.List
-- > transpose [[1,2,3],[4,5,6],[7,8,9]]
--   [[1,4,7],[2,5,8],[3,6,9]]

diag :: Grid -> [Player]
diag g = [ g !! n !! n | n <- [0..size-1]]
