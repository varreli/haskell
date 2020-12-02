import HuttParse
import Control.Applicative
import Data.Char

upp = parse (fmap toUpper item) "xyz"

low = parse (fmap toLower item) ""

ff = parse (pure 88) "abc"

ii = parse three "wqxijk"

three :: Parser (Char,Char) 
three = pure g <*> item <*> item <*> item 
    where g x y z = (x,z)

three' = do x <- item 
            item 
            z <- item 
            return (x,z)  -- return == pure : (injects the vals) 

----------------------------------------------------------------
instance Alternative Parser where
-- empty = Nothing
  empty = P (\inp -> [])
-- (<|>) :: Parser a -> Parser -> a -> Parser a
  p <|> q = P (\inp -> case parse p inp of
                         [] -> parse q inp
                         [(v,out)] -> [(v,out)])

returnHead = parse (item <|> return 'd') "abcd"
-- [('a',"bcd")]
returnD = parse (empty <|> return 'd') "abcd"
-- [('d',"abcd")]
