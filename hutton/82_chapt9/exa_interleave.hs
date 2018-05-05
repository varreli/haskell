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



-- to see actual ghc evaluation order, comment out after 'in' 
-- statement on line 10.