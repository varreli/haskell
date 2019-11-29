fmap3 :: Applicative f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
fmap3 g x y z = pure g <*> x <*> y <*> z

main :: IO () 
main = print $ fmap3 (\x y z -> x + y ^ z) [1,2] [2,3] [2,3]

-- $ ghc -O applicativeTest.hs
-- $ ./applicativeTest
-- $ [3,5,16,55,68,78]


 
