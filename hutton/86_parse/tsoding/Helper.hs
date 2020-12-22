import Main
module Helper where

spanP :: (Char -> Bool) -> Parser String
spanP pred input = Parser $ \input -> let
                                (rest,token) = span pred input
                                  in Just (token,rest)
