f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))

-- actual output :
-- f :: (t1, b1) -> (t, b) -> ((b1, b), (t1, t))
