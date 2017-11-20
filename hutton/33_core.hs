-- Add the elements of a list:

adder :: [Int] -> Int
adder [] = 0
adder (x:xs) = x + (adder xs)


-- select the last element of a non-empty list:

last1 :: [a] -> a

last1 [x] = x
last1 (x:xs) = last1 xs
