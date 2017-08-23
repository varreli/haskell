-- takes a list of values 1..500 and returns only
-- numbers divisible by 13 and 9.

divisBy9and13 = [ x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]
