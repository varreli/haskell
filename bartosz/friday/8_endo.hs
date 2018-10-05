import Data.Monoid

main = do
    let f = (+1) . ((*2) . negate)
        g = ((+1) . (*2)) . negate

    putStrLn "These are equal:"
    print $ f 5
    print $ g 5



-- This is equivalent:

ff :: Endo Int
ff = mconcat $ map Endo [(+ 1), (* 2), negate]
--
tt = appEndo ff 5
