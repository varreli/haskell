Prelude> foldl (flip (:)) [5,6,7] [1,2,3,4]
[4,3,2,1,5,6,7]

-- We start out with the base value being [1,2,3]. 
-- The first time through, foldl does 

foldl (yourFunction [1,2,3] 10) 

-- it expects a list back, and flip is required
-- because the types need to agree with (:) :

foldl (flip (:)) 10 [1,2,3]
10 : [1,2,3]


λ > foldl (/) 64 [4,2,4] 

λ > foldl (-) 30 [1,2] 
