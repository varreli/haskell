tracePlus b = let (c, d) = (d, b:d) 
              in c
main = do
    w <- return $ take 10 $ tracePlus 7
    print w
