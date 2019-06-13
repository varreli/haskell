import Data.Char
import Data.List
import System.IO

size :: Int
size = 2

type Grid = [[Player]]

data Player = O | B | X
              deriving (Eq, Ord, Show)


