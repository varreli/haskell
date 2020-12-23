module StringP where
newtype Parser a = Parser {runParser :: String -> Maybe (String,a)
                          }

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
                          (input', x) <- p input      -- this proves Parser is a functor
                          Just (input', f x)           -- (also we can use do since its a Monad)

-- ghci> runParser (fmap ord $ charP 'n') "nice"
-- Just (110, "ice")

-- now to prove Parser is Applicative,
-- using holes:

instance Applicative Parser where
    pure x = Parser $ \input -> Just (input, x)   -- ignores input, but forwards it to (x, input) 
--  (Parser p1) <*> (Parser p2) = _a 

--  (Parser p1) <*> (Parser p2) = Parser $ \input -> _a  -- expand to a Parser which accepts input
                                  
    (Parser p1) <*> (Parser p2) = 
      Parser $ \input -> do
        (input', f) <- p1 input
        (input'', a) <- p2 input'
        Just (input'', f a)

-- note similarity between (<*>) and fmap

-- fmap  ::   (a -> b) -> f a -> f b
-- (<*>) :: f (a -> b) -> f a -> f b     -- so why use (<*>) ? :

-- currying: 
--           fmap (+) Just 5 ==> Just (+5) <*> Just 6   ==> Just 11
--            (+) <$> Just 5 ==> (Just +5 )
-- 1st arg to <*> is:        ==> f (a -> b)

                                                  
-- also it scales; this function constructs a tuple of 4 elements:

-- ghci> (,,,) <$> Just 1 <*> Just <*> Just 3 <*> Just 4
-- Just (1,2,3,4)




