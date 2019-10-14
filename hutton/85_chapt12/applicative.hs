-- applicative is left associative:   g <*> x <*> y <*> z
--                                  ((g <*> x) <*> y) <*> z


fmap0 :: Applicative f => a -> f a   -- pure has "return-type polymorphism"
fmap0 = pure                         -- so the type of the return type
				     -- dictates which instance (implementation) 
				     -- of pure to use


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

-- > fmap3 (\x y z -> x * y + z) [10,100] [3,5] [8,9]
-- [38,39,58,59,308,309,508,509]

-- > fmap3 (\x y z -> x * y ^ z) (Just 10) (Just 3) (Just 7)
-- Just 21870 

----------------------------------------------------------------------

-- > map Just $  [(+), (*), (^)] <*> [a,b] <*> [1,2,3] :: [Maybe Expr]

-- > [(+), (*), (^)] <*> [a,b] <*> [1,2,3] :: [Expr]

-- > a:b:c:[]      -- list with 3 elements
-- [a,b,c]
-- > a:b:c:a+2:[]
-- [a,b,c,a + 2]   -- list with four elements, a, b, c and a + 2

----------------------------------------------------------------------

-- > pure [f,g,h] <*> [x,y,z]

-- If you have a tuple of functions, you can pattern match on 
-- the tuple 
-- > (\(f,g) -> [f,g] <*> xs <*> ys)
