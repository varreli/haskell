newtype Naturale = MakeNatural Integer deriving Show

toNatural :: Integer -> Naturale 
toNatural x | x < 0 = error "Cant create negative naturales!"
            | otherwise = MakeNatural x

fromNatural :: Naturale -> Integer
fromNatural (MakeNatural i) = i

instance Num Naturale where
    fromInteger = toNatural
    x + y   = toNatural (fromNatural x + fromNatural y)
    x * y   = toNatural (fromNatural x * fromNatural y)
    x - y   = let r = fromNatural x - fromNatural y in
                if r < 0 then error "Unnatural subtraction"
                else toNatural r
