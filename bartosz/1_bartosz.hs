import Data.Monoid
import Safe (readMay)     --   $ cabal install safe     first
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
    print $ foldr (<>) mempty ["Hello, ", "Monoids are ", mempty, "Cool"] 

ff = flip (++)
tt = (<>) (Just "Peace") (Just " Out")  -- (<>) is mappend

-- note:
-- > tt <> mempty <> Nothing <> Just " Dude"
-- Just "Peace Out Dude"

numbers :: Maybe [Int]
numbers = readMay "[1,2,3]" <> readMay "[90" <> readMay "[4,5,6]" <> mempty 
-- ( "[90" will fail )

vals :: [Maybe Int]
vals = [readMay "ignored", readMay "1", readMay "5"]

aa = print . mconcat $ map First vals
bb = print . mconcat $ map Last  vals

--

values :: [Maybe String]
values = [readMay "\"balloon\"", readMay "1", readMay "5"]

cc = print . mconcat $ map First values

--

valls :: [Int]
valls = [3,7,11]

pp = print . mconcat $ map Sum valls
qq = print . mconcat $ map Product valls

--

vallues :: [Bool]
vallues = [False,False,True]

rr = print . mconcat $ map All vallues
ss = print . mconcat $ map Any vallues

