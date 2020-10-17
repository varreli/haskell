v1 :: String -> Int
v1 = length . filter (not . null) . lines 

v2 :: String -> Int
v2 = fg . lines
  where
        fg = length . filter (not . null)

v3 :: String -> Int
v3 = length . gh
  where
        gh = filter (not . null) . lines

main = do
    print $ v1 "a\n\nb\nc"
    print $ v2 "a\n\nb\nc"
    print $ v3 "a\n\nb\nc"

