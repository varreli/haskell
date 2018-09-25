import Data.Monoid

main = do
    let a = [1,1,2]
        b = [3,5]
        c = [8,13]

    putStrLn "These 3 are equal:"
    print $  foldr (<>) mempty [a, b, c]
    print $ a ++ (b ++ c)
    print $ (a ++ b) ++ c
    putStrLn "\nThese leave 'a' alone:"
    print $ a ++ []
    print $ [] ++ a

-- --------------------------------------

    putStrLn "\nThese are equal:"
    print $ "Hello there!" <>  mempty <> " Monoids are"  <> " neat!" <> mempty
    print $ "Hello there!" <> (mempty <> " Monoids are") <> " neat!" <> mempty

ff = flip (++)
tt = (<>) (Just "Peace") (Just " Out")  -- (<>) is mappend

-- note:

-- > tt <> mempty <> Nothing <> Just " Dude"
-- Just "Peace Out Dude"
