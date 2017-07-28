nonsense :: Bool -> Integer

nonsense True = 805
nonsense False = 31337


curriedFunc :: Integer -> Bool -> Integer
curriedFunc i b = i + (nonsense b)

uncurriedFunc :: (Integer, Bool) -> Integer
uncurriedFunc (i, b) = i + (nonsense b)

anonymous :: Integer -> Bool -> Integer
anonymous = \ i b -> i + (nonsense b)

anonNested :: Integer -> Bool -> Integer
anonNested = \i -> \b -> i + nonsense b
