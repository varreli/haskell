unnfold :: (d -> Bool) -> (d -> f) -> (d -> d) -> d -> [f]

unnfold p h t x
  | p x       = []
  | otherwise = h x : unnfold p h t (t x)

-------------------------------------------------------

type Bit = Int

unfold_chop :: [Bit] -> [[Bit]]
unfold_chop = unnfold (== []) (take 8) (drop 8)


chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)


-------------------------------------------------------

unfoldMap :: (a -> b) -> [a] -> [b]
unfoldMap f = unnfold null (f . head) tail

-- core map :

mapp _ []     = []
mapp f (x:xs) = f x : mapp f xs
