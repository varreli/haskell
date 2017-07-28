subtractStuff :: Integer -> Integer -> Integer

subtractStuff x y = x - y - 10
subtractOne = subtractStuff 1

-- variables expressed as functions :
-- subtractStuff = \x -> \y -> x - y - 10
