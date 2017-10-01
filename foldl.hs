Prelude> foldl (flip (:)) [5,6,7] [1,2,3,4]
[4,3,2,1,5,6,7]

-- We start out with the base value being [1,2,3]. 
-- The first time through, foldl does 

foldl (yourFunction [1,2,3] 10) 

-- it expects a list back, and flip is required
-- because the types need to agree with (:) :

foldl (flip (:)) [1,2,3] 10
-- is the same as:
(:) 10 [1,2,3]

-- (:) has this pattern 
a -> [a] -> [a] 

-- so we need (flip (:)) to get :
[a] -> a -> [a]

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl (flip (:)) :: Foldable t => [a] -> t a -> [a]

(b -> a -> b) -> b -> [a] -> b

-- so now substitute in our relations of those to t: 
(b ~ [t], a ~ t):  ([t] -> t -> [t]) -> [t] -> [t] -> [t]

-- b unifies with [t], a unifies with t 

-- (flip (:)) is handed the current base (b) and a list 
-- element (a) and produces a new base (b). You provide
-- an initial base (misnamed accumulator), and a list 
-- (Foldable).  



λ > foldl (/) 64 [4,2,4] 

λ > foldl (-) 30 [1,2] 
