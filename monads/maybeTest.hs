maybeFunc1 :: String -> Maybe Int
maybeFunc1 "" = Nothing
maybeFunc1 str = Just $ length str

maybeFunc2 :: Int -> Maybe Float
maybeFunc2 i = if i `mod` 2 == 0
  then Nothing
  else Just ((fromIntegral i) * 3.14159)

maybeFunc3 :: Float -> Maybe [Int]
maybeFunc3 f = if f > 17.0
  then Nothing
  else Just [floor f, ceiling f]

runMaybeFuncs :: String -> Maybe [Int]
runMaybeFuncs input = case maybeFunc1 input of
  Nothing -> Nothing
  Just i -> case maybeFunc2 i of
    Nothing -> Nothing
    Just f -> maybeFunc3 f

-- instance Monad Maybe where
--   return = Just
--   Nothing >>= _ = Nothing
--   Just a >>= f = f a

-- Same using Monads:

runMaybeFuncsBind :: String -> Maybe [Int]
runMaybeFuncsBind input = maybeFunc1 input >>= maybeFunc2 >>= maybeFunc3

runMaybe :: String -> Maybe [Int]
runMaybe input = do
  i <- maybeFunc1 input
  f <- maybeFunc2 (i + 2)
  maybeFunc3 f
