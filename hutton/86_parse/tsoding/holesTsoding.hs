-- using holes to read ghci errors and relevant bindings surrounding hole:

charP :: Char -> Parser Char  
charP c = Parser $ \input -> _a     -- first hole

 
charP :: Char -> Parser Char  
charP c = Parser $ \input -> 
          case input of
            y:ys -> _a     -- | second hole
          []     -> _b     -- | third hole                          

-- (pattern match the input and extract one char from it):


charP :: Char -> Parser Char  
charP c = Parser $ \input -> 
          case input of
            y:ys | y == c -> Just (c,ys)  -- only if c == expected char
          []              -> Nothing

charP :: Char -> Parser Char  
charP c = Parser $ \input -> 
          case input of        
            y:ys | y == c -> Just (c, ys)
          _               -> Nothing       -- generalize [] to anything
                                           -- y /== c iincluding [] 
-----------------------------------------------------------------------------

-- Proving that Parser is a Functor and Applicative:

-- stringP :: String -> Parser String
-- stringP = input = sequenceA $ map charP input

-- In " map charP "null " we have two parameterized types
-- 1) a list parameterized by the elements it *contains* ,
-- Parser Char, and 
-- 2) Parser, parameterized by the elements it parsers:

-- [Parser Char] -> Parser [Char]

-- To use sequenceA, we need to prove to ghc that Parser is 
-- Functor and Applicative:

 
instance Functor Parser where
    fmap f (Parser p) = Parser $ \input -> do         -- p is the func that consumes input
                          (x, input') <- p input      -- this proves Parser is a functor
                          Just (f x, input')           -- (also we can use do since its a Monad)

-- ghci> runParser (fmap ord $ charP 'n') "nice"
-- Just (110, "ice")

-- now to prove Parser is Applicative:

instance Applicative Parser where
    pure x = \input -> Just (x, input)
    p1 <*> p2 = _a 

-- note similarity between (<*>) and fmap

-- fmap  ::   (a -> b) -> f a -> f b
-- (<*>) :: f (a -> b) -> f a -> f b     -- so why use (<*>) ? :

-- ghci> (+) <$> Just 5 <*> Just 6       -- currying: fmap (+) Just 5 ==> Just (+5) <*> Just 6 ==> Just 11

-- also it scales:

-- ghci> (,,,) <$> Just 1 <*> Just <*> Just 3 <*> Just 4
-- Just (1,2,3,4)
