altMap :: (a -> b) -> (a -> b) -> [a] -> [b]

altMap _ _ [] = []
altMap f _ (x:[])   = f x : []
altMap f g (x:y:[]) = f x : g y : []
altMap f g (x:y:xs) = f x : g y : altMap f g xs



-- one less line:

altMap' :: (a -> b) -> (a -> b) -> [a] -> [b]

altMap' f g []       = []
altMap' f g (x:[])   = f x : []
altMap' f g (x:y:xs) = f x : g y : altMap' f g xs
