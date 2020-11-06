import Control.Monad

replicateMM n comp
  | n <= 0 = return []
  | otherwise = do
    res <- comp
    rest <- replicateMM (n-1) comp
    return (res:rest)


qq = replicateMM 2 ['a']
rr = join $ replicateMM 4 ['A'] 
ss = replicateMM 5 [Just 5]


