dfs, bfs :: (a -> [a]) -> a -> [a]
dfs succ start = start : concatMap (dfs succ) (succ start)
bfs succ start = concat $ takeWhile (not . null) $ iterate (concatMap succ) [start]

testSucc 1 = [2,3,4]
testSucc 2 = [5]
testSucc 3 = [8,9,10]
testSucc 4 = [11,12,13]
testSucc 8 = [14,15]
testSucc _ = []

-- https://qmaurmann.wordpress.com/2014/06/28/haskell-one-liners-for-search/
