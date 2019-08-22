data Expr = Val Int | Div Expr Expr

safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv n m = Just (n `div` m)

eval :: Expr -> Maybe Int
eval (Val n) = Just n
eval (Div x y) = case eval x of 
                    Nothing -> Nothing
                    Just n -> case eval y of 
                                 Nothing -> Nothing
                                 Just m -> safediv n m 


-- to convert to applicative style, this would fail 
-- for two reasons:

-- eval' :: Expr -> Maybe Int
-- eval' (Val n) = pure n
-- eval' (Div x y) = pure safediv <*> eval x <*> eval y

-- 1) safediv has type Int -> Int -> Maybe Int, but this
-- would need:         Int -> Int -> Int

-- 2) replacing pure safediv would also fail, since the
-- new function would need Maybe (Int -> Int -> Int) ,
-- which has no provision for divide by zero.
