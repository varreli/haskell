
fmap3 :: Applicative f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
fmap3 g x y z = pure g <*> x <*> y <*> z

main :: IO [()]

main = fmap3 (\x y z -> x + y ^ z) [3,4] [5,6] [7,8]
