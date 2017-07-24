module Print3 where

myGreeting :: String 

myGreeting = "Whassup" ++ " Jack?"

hey :: String
hey = "Hey"

meng :: [Char] -- equivalent
meng = "meng"

main :: IO ()

main = do
  putStrLn myGreeting
  putStrLn myOtherGreeting
  where myOtherGreeting = concat [hey, " ", meng]
