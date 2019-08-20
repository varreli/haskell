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

