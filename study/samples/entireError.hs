myyX = 5 :: Int 

sigmund :: Num a => a -> a 
sigmund x = myyX

-- <interactive>:17:61: error:
--    • Couldn't match expected type ‘a’ 
--    with actual type ‘Int’
--      ‘a’ is a rigid type variable bound by
--        the type signature for:
--          sigmundo' :: forall a. Num a => a -> a
--        at <interactive>:17:30
--    • In the expression: myyX
--      In an equation for ‘sigmundo'’: 
--      sigmundo' x = myyX
--    • Relevant bindings include
--        x :: a (bound at <interactive>:17:57)
--        sigmundo' :: a -> a 
--	(bound at <interactive>:17:47)


myyX = 5 :: Int

sigmund' :: Int -> Int
sigmund' x = myyX
