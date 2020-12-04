import HuttParse
import Control.Applicative
import Data.Char

instance Alternative Parser where
-- empty = Nothing
  empty = P (\inp -> [])
-- (<|>) :: Parser a -> Parser a -> Parser a
  p <|> q = P (\inp -> case parse p inp of
                         [] -> parse q inp
                         [(v,out)] -> [(v,out)])

returnHead = parse (item <|> return 'd') "abcd"
-- [('a',"bcd")]
returnD = parse (empty <|> return 'd') "abcd"
-- [('d',"abcd")]

satisfy :: (Char -> Bool) -> Parser Char
satisfy p = do x <- item
               if p x then return x 
               else empty              -- empty from Alt Parser

digit :: Parser Char
digit = satisfy isDigit

lower :: Parser Char
lower = satisfy isLower     -- same as: upper = satisfy isUpper

alphanum :: Parser Char
alphanum = satisfy isAlphaNum    -- or letter = satisfy isAlpha

char :: Char -> Parser Char
char x = satisfy (== x)    
-- > parse (char 't') "toy" => ('t',"oy")
stringg :: String -> Parser String
stringg [] = return []
stringg (x:xs) = do char x
                    stringg xs
                    return (x:xs)

full = parse (stringg "anti") "antitrust"
missing = parse (stringg "abc") "ab123"    -- fails: missing 'c'

identifier :: Parser String
identifier = do x <- lower
                xs <- many alphanum
                return (x:xs)
keywords =
  ["case","class","data","default","deriving","do","else","forall"
  ,"if","import","in","infix","infixl","infixr","instance","let","module"
  ,"newtype","of","qualified","then","type","where","_"
  ,"foreign","ccall","as","safe","unsafe"]

nat :: Parser Int
nat = do xs <- some digit
         return (read xs)

space :: Parser ()
space = do many (satisfy isSpace)
           return ()  

 
