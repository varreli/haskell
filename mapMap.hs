zipWith ($) (map map [(+1), (*2)]) [[1, 2], [3, 4]]
-- [[2,3],[6,8]]

 > zipWith ($) (map map [(+1), (*2)]) (repeat [1..4])
 <lambdabot>  [[2,3,4,5],[2,4,6,8]]

> zipWith (+) [10,20] [4,5]
[14,25]

----------------------------------------------------------

(.).(.) :

-- Here you have a b -> c and an a1 -> a2 -> b, so you can 
-- get a function a1 -> a2 -> c by supplying the a1 and a2 
-- to your second argument to get a b, then applying your 
-- first argument to get a c

