import Data.Foldable
import Data.Monoid

data LeafyTree a
    = Branch [LeafyTree a]
    | Leaf a
-- show
instance Foldable LeafyTree where
    foldMap f (Branch xs) = mconcat $ map (foldMap f) xs
    foldMap f (Leaf a) = f a

tree1 = Branch [Leaf "abr", Branch [Branch [Leaf "a", Leaf "ca"], Leaf "dabra"]]

tree2 = Branch [Leaf "abr", Leaf "a", Branch [Leaf "ca", Leaf "dabra"]]

main = do
    putStrLn "These are equal:"
    print $ foldMap (Sum . length) tree1
    print $ foldMap (Sum . length) tree2
    
    -- Since the leaves are Monoids, we can just directly merge them:
    putStrLn "Also equal:"
    print $ foldMap id tree1
    print $ foldMap id tree2
