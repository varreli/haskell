type Bit = Int


unfoldo :: (d -> Bool) -> (d -> f) -> (d -> d) -> d -> [f]

unfoldo p h t x
  | p x       = []
  | otherwise = h x : unfoldo p h t (t x)

chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

-- chopp8 uses unfoldo :

chopp8 :: [Bit] -> [[Bit]]
chopp8 = unfoldo (== []) (take 8) (drop 8)
