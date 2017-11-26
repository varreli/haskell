-- flip is required because the types need to 
-- agree with (:) . First, foldl extracts 10 :

foldl (flip (:)) [1,2,3] [10,11]
-- is the same as:
(:) 10 [1,2,3]
(:) 11 [10,1,2,3]

[11,10,1,2,3]


-- (:) has this pattern 
a -> [a] -> [a] 

-- the correct pattern for foldl is (flip (:)) 
[a] -> a -> [a]

-- since in the signature it is (b -> a -> b)
foldl :: (b -> a -> b) -> b -> [a] -> b
foldl (flip (:)) :: Foldable g => [a] -> g a -> [a]


-- so now substitute in our relations of those to t: 
(b ~ [t], a ~ t):  ([t] -> t -> [t]) -> [t] -> [t] -> [t]

-- b unifies with [t], a unifies with t 

-- (flip (:)) is handed the current base (b) and a list 
-- element (a) and produces a new base (b). You provide
-- an initial base (misnamed accumulator), and a list 
-- (Foldable).  


-- examples:

λ > foldl (/) 64 [1,2,4] 
λ > scanl (/) 64 [1,4,2] 

λ > foldl (-) 30 [1,2] 
λ > scanl (/) 30 [1,2] 

-- the first parameter (64) is a seed, or accumulator. 
-- It isn't updated, its just replaced with a new value.
-- Updating is mutation but this parameter is immutable.


-- Prelude > foldl (\x y -> 2*x + y) 4 [1,2,3]
-- 43

foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b

foldl f z [ ] = z
foldl f z (x : xs) = foldl f (f z x) xs
