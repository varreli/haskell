import Data.Monoid


-- associativity:

assoc1 = (Sum 5) <> (Sum 6.6 <> Sum 10)            -- newtype Sum
assoc2 = (Product 5 <> Product 10) <> (Product 2)  -- newtype Product
                                                   -- (both built into
                                                   -- monoid)

assoc3 = [5] <> ([10] <> [15]) 
assoc4 = ([1] <> [2]) <> [3]

-- identity:

left_id  = mappend mempty [2,3,4]
right_id = mappend [6,7,8] mempty


ss = foldr mappend mempty [Sum 5, Sum 12]
tt = foldr mappend mempty [[1],[2],[3]]
concatt = concat [[1],[2],[3]]


r = (Sum 8) <> (Sum 9)
s = mappend mempty Sum 10
t = mappend (Sum 2) (mappend (Sum 3) (Sum 4)) -- must be nested.
u = (Sum 6) <> (Sum 7) <> (Sum 8)            
v = mconcat [(Sum 1), (Sum 100)]

w = getSum $ mconcat [(Sum 50), (Sum 51)]         -- record field accessors
x = getProduct $ mappend (Product 5) (Product 2)  -- unwrap {getSum = 101}.

y = foldr mappend mempty ["are you", " experienced?"]
z = foldr mappend mempty ([2,4,6] :: [Product Int])

-- monoids and identity are good for parallel, concurrent and
-- distributed programming.
