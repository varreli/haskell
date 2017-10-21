safetail :: [a] -> [a]
safetail xs = if null xs
    then []
    else tail xs

safeTail :: [a] -> [a]
safeTail list
  | null list = [] 
  | otherwise = tail list

safetale :: [a] -> [a]
safetale [] = []
safetale (_:xs) = xs

(|||) :: Bool -> Bool -> Bool
True ||| True = True
True ||| False = True
False ||| True = True
False ||| False = False

(&&&) :: Bool -> Bool -> Bool
x &&& y = if x == True
  then if y == True
    then True
    else False
  else False

-- https://github.com/macalimlim/programming-in-haskell
