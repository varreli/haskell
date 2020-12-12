module Main where

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
jsonNull :: Parser JsonValue
jsonNull = undefined
 
charP :: Char -> Parser Char       -- helper function to parse a single char, (parameter Char ->)
charP c = Parser $ \input ->       -- and supplies a Parser to parse that char
          case input of        
            y:ys 
              | y == c -> Just (c, ys)
            _  -> Nothing                   -- wildcard generalizes the case and indicates 
                                            -- anything where y /== c, or []  

-- The above is a parser capable of parsing a single char ---------------------------------------
-- use the hole this way: 
jsonValue :: Parser JsonValue
jsonValue = undefined
 
-- 'a' is what makes the parsers composable.
-- a parser that is capable of parsing a (in this case each JsonValue)



               



main :: IO ()
main = undefined
