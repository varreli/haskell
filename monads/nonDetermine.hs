qq = (+) <$> [1,2] <*> [4,5,6] 
-- [5,6,7,6,7,8]

rr = (,) <$> [1,2] <*> [4,5,6]
-- [(1,4),(1,5),(1,6),(2,4),(2,5),(2,6)]

-- Its not about purity, ie, outputs depending 
-- with certainty on inputs.

-- Its about how they are "thinking about lists as 
-- if they represented different possible inputs"
                                                           
-- (+) isn't invertible, but (,) is

-- (+) is a non-product
-- (,) is a product

------------------------------------------------------

-- f :: A -> [B]
-- g :: B -> [C]
-- h :: A -> [C]

h x = concat [g y | y <- f x]
-- h x = f x >>= g
-- h = f >=> g      -- note fish not beta.

