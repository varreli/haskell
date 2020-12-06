import ParseFull
import Control.Applicative
import Data.Char

upp = parse (fmap toUpper item) "xyz"

low = parse (fmap toLower item) ""

ff = parse (pure 88) "abc"

ii = parse three "wqxijk"

three :: Parser (Char,Char) 
three = pure g <*> item <*> item <*> item 
    where g x y z = (x,z)

three' :: Parser (Char,Char) 
three' = do x <- item 
            item 
            z <- item 
            return (x,z)  -- return == pure : (injects the vals) 

