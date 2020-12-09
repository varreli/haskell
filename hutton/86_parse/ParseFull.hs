module ParseFull where
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

---------------------------------------------------------------
instance Applicative Parser where
-- pure :: a -> Parser a
  pure v = P (\inp -> [(v,inp)])
-- (<*>) :: Parser (a -> b) -> Parser a -> Parser b
  pg <*> px = P (\inp -> case
                            parse pg inp of
                            [] -> []
                            [(g,out)] -> parse (fmap g px) out)

----------------------------------------------------------------
instance Monad Parser where
-- (>>=) :: Parser a -> (a -> Parser b) -> Parser b
  p >>= ff = P (\inp -> case
                          parse p inp of
                          [] -> []
                          [(v,out)] -> parse (ff v) out)

----------------------------------------------------------------

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
-----------------------------------------------------------------

string :: String -> Parser String
string [] = return []
string (x:xs) = do  char x
                    string xs
                    return (x:xs)

full = parse (string "anti") "antitrust"
missing = parse (string "abc") "ab123"    -- fails: missing 'c'

identify :: Parser String
identify = do   x <- lower
                xs <- many alphanum
                if (elem (x:xs) keywords) then  
                  error "cannot parse: haskell keyword" 
                else return (x:xs)

nat :: Parser Int
nat = do xs <- some digit
         return (read xs)

space :: Parser ()
space = do many (satisfy isSpace)
           return ()  

int :: Parser Int
int = do char '-'
         n <- nat
         return (-n)
         <|> nat

token :: Parser a -> Parser a
token p = do space
             v <- p
             space
             return v

identifier :: Parser String
identifier = token identify
-------------------------------------------------------------------------
toke :: Parser a -> Parser a
toke parrser = space >>= \_ -> parrser >>= \v -> space >>= \_ -> return v

identifier' :: Parser String
identifier' = toke identify
-------------------------------------------------------------------------
natural :: Parser Int
natural = token nat

integer :: Parser Int
integer = token int

symbol :: String -> Parser String
symbol xs = token (string xs)

nats :: Parser [Int]
nats = do symbol "["
          n <- natural
          ns <- many $ do 
            symbol ","  
            natural
          symbol "]"
          return (n:ns)
-----------------------------------------------------------------

expr :: Parser Int
expr = do t <- term
          do       
            symbol "+"
            e <- expr
            return (t + e) <|> return t

term :: Parser Int
term = do f <- factor
          do
            symbol "*"
            t <- term
            return (f * t) <|> return f

factor :: Parser Int 
factor = do symbol "("
            *> expr 
            <* symbol ")"
            <|> natural

eval :: String -> Int
eval xs = case (parse expr xs) of
             [(n,[])]  -> n 
             [(_,out)] -> error ("Unused input " ++ out)
             []        -> error "Invalid input"

------------------------------------------------------------------
-- expr   ::=  term (+ expr | ∊)
-- term   ::=  factor (* term | ∊)
-- factor ::=  ( expr ) | nat
-- nat    ::=  0 | 1 | 2 | ...
------------------------------------------------------------------

keywords =
  ["case","class","data","default","deriving","do","else","forall"
  ,"if","import","in","infix","infixl","infixr","instance","let","module"
  ,"newtype","of","qualified","then","type","where","_"
  ,"foreign","ccall","as","safe","unsafe"]

