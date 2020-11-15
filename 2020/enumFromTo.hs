-- concatMap :: Foldable t => (a -> [b]) -> t a -> [b]

aa = concatMap (enumFromTo 1) [1,3,5]
-- [1,1,2,3,1,2,3,4,5]

bb = concatMap (\x -> [(x,x+5,x/2)]) [4,5]
-- [(4.0,9.0,2.0),(5.0,10.0,2.5)]


