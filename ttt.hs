-- ifThen :: (Ord a, Num a) => a -> a -> a 
-- ifThen = (\x -> (\y -> if x > y then y else x ) + 5 

ifThen :: (Ord a, Num a) => a -> a -> a
ifThen = (\x -> (\y -> (if x > y then y else x) + 5))
ifThen = (\x -> \y -> if x > y then y else x ) + 5

--cool function called "unschönfinkelsation"
-- <Akii> :t uncurry
-- <lambdabot> (a -> b -> c) -> (a, b) -> c
-- <Akii> define ifThen like you wrote above then check the type after applying uncurry
-- <Akii> and then implement uncurry!
