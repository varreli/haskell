f :: Int -> Maybe Int
f 0 = Nothing
f x = Just (x-1)

g :: Int -> Maybe Int
g 100 = Nothing
g x = Just (x*10)

h :: Int -> Maybe Int
h x = case f x of
        Just n -> g n
        Nothing -> Nothing
 
hh :: Int -> Maybe Int
hh x = do n <- f x
          g n

