import Debug.Trace

data Move = North | South | East | West deriving Show

type Pos = (Int, Int)

move :: Move -> Pos -> Pos
move North (x, y) = (x, y + 1)
move South (x, y) = (x, y - 1)
move East  (x, y) = (x + 1, y)
move West  (x, y) = (x - 1, y)

moves :: [Move] -> Pos -> Pos
moves m p | traceShow (m, p) False = undefined
moves [] p = p
moves (m:ms) p = moves ms (move m p)

rev :: Move -> Move
rev North = South
rev South = North
rev East  = West
rev West  = East

-- note traceShow x y    will evaluate to y 

-- moves m p | traceShow (m, p) False = undefined
-- evaluates to `moves m p | False = undefined

-- and traceShow (m, p) is emitted as a stderr
-- which is the output
