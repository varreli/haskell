fmap3 :: Applicative f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
fmap3 g x y z = pure g <*> x <*> y <*> z

main :: IO [Integer]
main = return $ fmap3 (\x y z -> x + y ^ z) [1,2] [2,3] [2,3]

 
