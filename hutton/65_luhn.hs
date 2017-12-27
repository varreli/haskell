altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
 
altMap f g []       = []
altMap f g (x:[])   = f x : []
altMap f g (x:y:xs) = f x : g y : altMap f g xs


-- --


luhnDouble :: Int -> Int
luhnDouble x = if n < 10 then n else n - 9
                where n = x*2

mod10is0 :: Integral a => a -> Bool
mod10is0 x = (mod x 10) == 0

luhn :: [Int] -> Bool
luhn = mod10is0 . sum . (altMap luhnDouble id)
