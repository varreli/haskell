identifier :: Parser String
identifier = do x <- lower
                xs <- many alphanum
                guard $ notElem (x:xs) keywords
                return (x:xs)

