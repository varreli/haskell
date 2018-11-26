import Data.List
import Data.Char

data CMaybe a = CNothing | CJust Int a deriving Show

instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = CJust (counter +1) (f x)


t = (<$>) (map toUpper) (fmap (intersperse '-') (CJust 0 "hoot"))

-- note use of (map toUpper) in line 11
