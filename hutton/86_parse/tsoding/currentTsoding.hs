-- minute 1:00hr
module Main where
import Data.Char
import Control.Applicative
-- definition of the AST:

data JsonValue = JsonNull
               | JsonBool Bool                     -- encapsulates haskell type
               | JsonNumber Integer                -- no support for floats
               | JsonString String
               | JsonArray [JsonValue]             -- JsonArray is a type of JsonValue; this is where it becomes recursive
               | JsonObject [(String, JsonValue)]  -- key/value pairs: a list of pairs to implement an associative array.
               deriving (Show, Eq)

-- now we implement small parsers to parse each individual type of JsonValue and combine them:

-- type parser a = String -> Maybe [(a, String)] 
-- but this is a type synonym (rhs and lhs indistinguishible to ghc; so we need newtype):


newtype Parser a = Parser 
                 { runParser :: String -> Maybe (a, String)
                 } 

instance Functor Parser where
    fmap f (Parser p) = 
      Parser $ \input -> do         -- p is the func that consumes input
        (x, input') <- p input      -- this proves Parser is a functor
        Just (f x, input')           -- (also we can use do since its a Monad)

-- ghci> runParser (fmap ord $ charP 'n') "nice"
-- Just (110, "ice")

-- now to prove Parser is Applicative:

instance Applicative Parser where
    pure x = Parser $ \input -> Just (x, input)
    (Parser p1) <*> (Parser p2) = 
      Parser $ \input -> do
      (f, input') <- p1 input
      (a, input'') <- p2 input'
      Just (f a, input'')

instance Alternative Parser where
  empty = Parser $ \_ -> Nothing
  (Parser p1) <|> (Parser p2) =
    Parser $ \input -> p1 input <|> p2 input
   
jsonNull :: Parser JsonValue
jsonNull = (\_ -> JsonNull) <$> stringP "null"

jsonBool :: Parser JsonValue
jsonBool = f <$> (stringP "true" <|> stringP "false")
    where
      f "true" = JsonBool True
      f "false" = JsonBool False 
      f _ = undefined

spanP :: (Char -> Bool) -> Parser String
spanP f =
  Parser $ \input ->
    let (token,rest) = span f input
     in Just (token,rest)

notNull :: Parser [a] -> Parser [a]
notNull (Parser p) =
  Parser $ \input -> do
    (input', xs) <- p input
    if null xs
      then Nothing
      else Just (input', xs)

jsonNumber :: Parser JsonValue
jsonNumber = f <$> notNull (spanP isDigit)
    where f ds = JsonNumber $ read ds

-- no escape support:
stringLiteral :: Parser String
stringLiteral = (charP '"' *> spanP (/= '"') <* charP '"') 

jsonString :: Parser JsonValue 
jsonString = JsonString <$> stringLiteral 
 
ws :: Parser String
ws = spanP isSpace

sepBy :: Parser a -> Parser b -> Parser [b]
sepBy sep element = (:) <$> element <*> many (sep *> element) <|> pure []
------------------------------------------------------------------------------------------------- 
charP :: Char -> Parser Char       -- helper function to parse a single char, (parameter Char ->)
charP c = Parser f                 -- and supplies a Parser to parse that char
            where 
              f (y:ys) 
                | y == c = Just (c, ys)
                | otherwise = Nothing  
              f [] = Nothing                  -- see tsoding 27:45 re: print/show error

-- The above is a parser capable of parsing a single char, therefore a sequence of chars --------
stringP :: String -> Parser String
-- stringP input = sequenceA $ map charP input
stringP          = sequenceA . map charP           -- eta reduced

-- [Parser Char] -> Parser [Char]
-- sequenceA :: Applicative f => t (f a) -> f (t a) -- traverse of appl. to appl. of traverse!                      


jsonValue :: Parser JsonValue
jsonValue = jsonNull <|> jsonBool 
 
-- 'a' is what makes the parsers composable.
-- a parser that is capable of parsing a (in this case each JsonValue)




main :: IO ()
main = undefined
