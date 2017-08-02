palindrome :: Eq a => [a] -> Bool
palindrome x = x == (reverse x)


palindrome2 :: Eq a => [a] -> [a] -> Bool
palindrome2 a b = a == (reverse b)


-- James Joyce :
-- "able was I ere I saw elba"

-- "wonder if sununu's fired now"
-- "wonderifsununusfirednow"
