module Main where
import Data.Char
import Control.Applicative

-- definition of the AST:

data JsonValue = JsonNull
               | JsonBool Bool   -- encapsulates haskell type
               | JsonNumber Integer -- no support for floats
               | JsonString String
               | JsonArray [JsonValue] -- JsonArray is a type of JsonValue; this is where it becomes recursive
               | JsonObject [(String, JsonValue)] -- key/value pairs: a list of pairs to implement an associative array.
               deriving (Show, Eq)

-- now we implement small parsers to parse each individual type of JsonValue and combine them:

-- type parser a = String -> Maybe [(a, String)] 
-- but this is a type synonym (rhs and lhs indistinguishible to ghc; so we need newtype):


newtype Parser a = Parser 
                 { runParser :: String -> Maybe (a, String) 
                 }

instance Functor Parser where
  fmap f (Parser p) = 
    Parser $ \input -> do
      (x, input') <- p input
      Just (f x, input')

instance Applicative Parser where
  pure x = Parser $ \input -> Just (x, input)
  p1 <*> p2 = _a

jsonNull :: Parser JsonValue
jsonNull = undefined
------------------------------------------------------------------------------------------------- 
charP :: Char -> Parser Char       -- helper function to parse a single char, (parameter Char ->)
charP c = Parser f                 -- and supplies a Parser to parse that char
            where 
              f (y:ys) 
                | y == c = Just (c, ys)
                | otherwise = Nothing  
              f [] = Nothing                  -- see tsoding 27:45 re: print/show error

                       

-- The above is a parser capable of parsing a single char, therefore a sequence of chars --------

jsonValue :: Parser JsonValue
jsonValue = undefined
 
-- 'a' is what makes the parsers composable.
-- a parser that is capable of parsing a (in this case each JsonValue)


main :: IO ()
main = undefined
