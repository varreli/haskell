import Control.Applicative
import Data.Char

newtype Parser a = P (String -> [(a,String)])  

parse :: Parser a -> String -> [(a,String)]
parse (P p) inp = p inp

item :: Parser Char 
item = P (\inp -> case inp of
                    [] -> []
                    (x:xs) -> [(x,xs)])
---------------------------------------------------------------
instance Functor Parser where
-- fmap :: (a -> b) -> Parser a -> Parser b
   fmap g p = P (\inp -> case
                           parse p inp of
                           [] -> []
                           [(v,out)] -> [(g v, out)])

upp = parse (fmap toUpper item) "xyz"
low = parse (fmap toLower item) ""
---------------------------------------------------------------
instance Applicative Parser where
-- pure :: a -> Parser a
  pure v = P (\inp -> [(v,inp)])
  pg <*> px = P (\inp -> case
                            parse pg inp of
                            [] -> []
                            [(g,out)] -> parse (fmap g px) out)

ff = parse (pure 88) "abc"

three :: Parser (Char,Char) 
three = pure g <*> item <*> item <*> item 
    where g x y z = (x,z)

ii = parse three "wqxijk"
-- ----------------------------------------------------------------
-- 
instance Monad Parser where
-- (>>=) :: Parser a -> (a -> Parser b) -> Parser b
  p >>= ff = P (\inp -> case
                          parse p inp of
                          [] -> []
                          [(v,out)] -> parse (ff v) out)

three' = do x <- item 
            item 
            z <- item 
            return (x,z)  -- return == pure : (injects the vals) 

instance Alternative Parser where
-- empty = Nothing
  empty = P (\inp -> [])
-- (<|>) :: Parser a -> Parser -> a -> Parser a
  p <|> q = P (\inp -> case parse p inp of
                         [] -> parse q inp
                         [(v,out)] -> [(v,out)])

-- ghci> parse (item <|> return 'd') "abcd"
-- [('a',"bcd")]
-- ghci> parse (empty <|> return 'd') "abcd"
-- [('d',"abcd")]

satisfy :: (Char -> Bool) -> Parser Char
satisfy p = do x <- item
               if p x then return x else empty

-- ghci> parse (satisfy isDigit) "3rst"
-- [('3',"rst")]

alphanum = parse (satisfy isAlphaNum)
-- ghci> alphanum "*45"
-- []

char :: Char -> Parser Char
char x = satisfy (== x) 
match letter = parse (char letter)
