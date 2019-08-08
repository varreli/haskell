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

----------------------------------------------------------------
prods :: [Int] -> [Int] -> [Int]
prods xs ys = [x*y | x <- xs, y <- ys]   -- list comprehension
                                         -- product


products :: [Int] -> [Int] -> [Int]
products xs ys = pure (*) <*> xs <*> ys  -- applicative product 
----------------------------------------------------------------

-- instance Applicative Maybe where
-- --  pure :: a -> Maybe a
--       pure = Just
-- --  (<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
--       Nothing <*> _ = Nothing
--       (Just g) <*> mx = fmap g mx

-- > fmapp (\x y z -> x * y + z) [10,100,1000] [3,4,5] [7,8,9]

-- > fmapp (\x y z -> x * y + z) (Just 10) (Just 3) (Just 7)

-- > map Just $  [(+), (*), (^)] <*> [a,b] <*> [1,2,3] :: [Maybe Expr]

-- > [(+), (*), (^)] <*> [a,b] <*> [1,2,3] :: [Expr]

-- > a:b:c:[]      -- list with 3 elements
-- [a,b,c]
-- > a:b:c:a+2:[]
-- [a,b,c,a + 2]   -- list with four elements, a, b, c and a + 2
