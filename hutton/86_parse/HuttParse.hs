module HuttParse where

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
