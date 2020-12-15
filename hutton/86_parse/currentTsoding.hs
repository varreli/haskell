module Main where
import Data.Char

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
    fmap f (Parser p) = Parser $ \input -> do         -- p is the func that consumes input
                          (x, input') <- p input      -- this proves Parser is a functor
                          Just (f x, input)           -- (also we can use do since its a Monad)

-- ghci> runParser (fmap ord $ charP 'n') "nice"
-- Just (110, "ice")

-- now to prove Parser is Applicative:

instance Applicative Parser where
    pure x = \input -> Just (x, input)
    (<*>) 
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

-- stringP :: String -> Parser String
-- stringP = input = sequenceA $ map charP input
                       

-- The above is a parser capable of parsing a single char, therefore a sequence of chars --------

jsonValue :: Parser JsonValue
jsonValue = undefined
 
-- 'a' is what makes the parsers composable.
-- a parser that is capable of parsing a (in this case each JsonValue)



               



main :: IO ()
main = undefined
