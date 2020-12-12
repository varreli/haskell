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
