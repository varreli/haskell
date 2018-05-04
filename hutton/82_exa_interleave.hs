-- [exa] wrote :

import Debug.Trace

interleave x []     = trace ("Finishing step!, returning " ++ show [[x]]) [[x]]
interleave x (y:ys) = let
  leftPart = (x:y:ys)
  interPart = interleave x ys
  rightPart = map (y:) interPart
  in leftPart `seq` rightPart `seq`
     trace "Recursive step!" $
     trace (" on the left: " ++ show leftPart) $
     trace (" on the right, first: " ++ show interPart) $
     trace ("   ... and then: " ++ show rightPart) $
     trace (" result: " ++ show (leftPart : rightPart)) $
     leftPart : rightPart  --actual result



-- on line 10 comment out after 'in' like this:

--         in -- leftPart `seq` rightPart `seq`
