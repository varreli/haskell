identifier :: Parser String
identifier = do x <- lower
                xs <- many alphanum
                return (x:xs)

