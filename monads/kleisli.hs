import Data.Char

-- note average is (a -> b)
average :: [Double] -> Double

average n = sum n / fromIntegral (length n)

(|>) :: (a -> b) -> (b -> c) -> (a -> c)
(|>) = flip (.)

vv = map toLower |> map toUpper -- |> map toLower
