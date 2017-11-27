-- foldr needs a "base case" to fill in for [], 
-- and 'id' won't change anything:

λ > foldr (.) id [(+3), (*8), (^2)] 4

131




λ > foldr (\ x f -> shows x . f) id [1 .. 4] ""

"1234"



λ > foldr (\x xs s -> s : xs (x + s)) (\s -> [s]) [1,2,3,4,5] 0

[0,1,3,6,10,15]


