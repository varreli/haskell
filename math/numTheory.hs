module NumTheory where

import Data.Ratio

jonesQuot, jonesRem :: Integral a => a -> a -> a

jonesQuot a b | b < 0 = ceiling (a % b)
                | b > 0 = floor   (a % b)
jonesRem a b = a - b * (a `jonesQuot` b)
