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


-- https://github.com/macalimlim/programming-in-haskell
