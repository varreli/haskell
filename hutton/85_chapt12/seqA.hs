getChars :: Int -> IO String
getChars 0 = return []
getChars n = pure (:) <*> getChar <*> getChars (n-1)

-- more generalized is seqA (Library function sequenceA) :

seqA :: Applicative f => [f a] -> f [a]
seqA [] = pure []
seqA (x:xs) = pure (:) <*> x <*> seqA xs

getChars' :: Int -> IO String
getChars' n = seqA (replicate n getChar)

