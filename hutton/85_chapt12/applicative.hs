-- applicative is left associative:   g <*> x <*> y <*> z
--                                  ((g <*> x) <*> y) <*> z

fmap0 :: Applicative f => a -> f a
fmap0 = pure --    degenerate case

fmap1 :: Applicative f => (a -> b) -> f a -> f b
fmap1 g x = pure g <*> x                             -- standard case

fmap2 :: Applicative f =>  (a -> b -> c) -> f a -> f b -> f c   
fmap2 g x y = pure g <*> x <*> y          --   and so on in hierarchy

fmap3 :: Applicative f => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
fmap3 g x y z = pure g <*> x <*> y <*> z

-- instance Applicative Maybe where
--  pure :: a -> Maybe a
--     pure = Just
--  (<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
--     Nothing <*> _ = Nothing
--     (Just g) <*> mx = fmap g mx
