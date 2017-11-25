reverrse :: [a] -> [a]
reverrse [] = []
reverrse (x:xs) = reverrse xs ++ [x]


-- note variation using foldr and snoc :

foldrr :: (a -> b -> b) -> b -> [a] -> b
foldrr f v [] = v
foldrr f v (x:xs) = f x (foldr f v xs)


snoc :: a -> [a] -> [a]    -- cons spelled backwards
snoc x xs = xs ++ [x]


revverse :: [a] -> [a]
revverse = foldrr snoc []


-- revverse without eta reduction :

-- revverse :: [a] -> [a]
-- revverse list = foldrr snoc [] list
