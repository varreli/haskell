laignth :: [a] -> Int                -- length is reserved word .
laignth [] = 0
laignth (x:xs) = 1 + laignth xs

main = print (laignth [1,2,3,2,5,6]) >> print (laignth ["red", "blue"])
